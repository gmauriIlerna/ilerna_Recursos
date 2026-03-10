import 'dart:typed_data';

import '../../core/session.dart';
import '../db/app_database.dart';
import '../../models/post_feed_item.dart';

class PostRepository {
  /// Feed completo o filtrado por usuario
  Future<List<PostFeedItem>> getFeed({int? onlyUserId}) async {
    final db = await AppDatabase.instance.database;

    final where = (onlyUserId != null) ? 'WHERE p.userId = ?' : '';
    final args = (onlyUserId != null) ? [onlyUserId] : <Object?>[];

    final rows = await db.rawQuery('''
      SELECT 
        p.id as postId,
        p.userId as userId,
        u.username as username,
        p.imageBlob as imageBlob,
        p.description as description,
        p.createdAt as createdAt
      FROM posts p
      JOIN users u ON u.id = p.userId
      $where
      ORDER BY p.createdAt DESC
    ''', args);

    final myUserId = Session.userId;
    final items = <PostFeedItem>[];

    for (final r in rows) {
      final postId = r['postId'] as int;

      final likeCount = await _getLikeCount(db, postId);
      final commentCount = await _getCommentCount(db, postId);
      final isLikedByMe = (myUserId == null)
          ? false
          : await _isLikedByUser(db, postId, myUserId);

      items.add(
        PostFeedItem(
          postId: postId,
          userId: r['userId'] as int,
          username: r['username'] as String,
          imageBytes:
          Uint8List.fromList(r['imageBlob'] as List<int>),
          description: r['description'] as String,
          createdAt: DateTime.fromMillisecondsSinceEpoch(
              r['createdAt'] as int),
          likeCount: likeCount,
          commentCount: commentCount,
          isLikedByMe: isLikedByMe,
        ),
      );
    }

    return items;
  }

  /// Crear post
  Future<void> createPost({
    required String description,
    required Uint8List imageBytes,
  }) async {
    final db = await AppDatabase.instance.database;
    final userId = Session.userId;

    if (userId == null) return;

    await db.insert('posts', {
      'userId': userId,
      'imageBlob': imageBytes,
      'description': description,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  /// Like / Unlike
  Future<void> toggleLike(int postId) async {
    final db = await AppDatabase.instance.database;
    final userId = Session.userId;
    if (userId == null) return;

    final alreadyLiked = await _isLikedByUser(db, postId, userId);

    if (alreadyLiked) {
      await db.delete(
        'likes',
        where: 'postId = ? AND userId = ?',
        whereArgs: [postId, userId],
      );
    } else {
      await db.insert('likes', {
        'postId': postId,
        'userId': userId,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      });
    }
  }

  /// 👉 AÑADIDO EN EL PASO 11
  /// Nº de posts de un usuario
  Future<int> getPostCountByUser(int userId) async {
    final db = await AppDatabase.instance.database;

    final res = await db.rawQuery(
      'SELECT COUNT(*) as c FROM posts WHERE userId = ?',
      [userId],
    );

    return (res.first['c'] as int?) ?? 0;
  }

  // ---- Helpers privados ----

  Future<int> _getLikeCount(dynamic db, int postId) async {
    final res = await db.rawQuery(
      'SELECT COUNT(*) as c FROM likes WHERE postId = ?',
      [postId],
    );
    return (res.first['c'] as int?) ?? 0;
  }

  Future<int> _getCommentCount(dynamic db, int postId) async {
    final res = await db.rawQuery(
      'SELECT COUNT(*) as c FROM comments WHERE postId = ?',
      [postId],
    );
    return (res.first['c'] as int?) ?? 0;
  }

  Future<bool> _isLikedByUser(
      dynamic db, int postId, int userId) async {
    final res = await db.query(
      'likes',
      where: 'postId = ? AND userId = ?',
      whereArgs: [postId, userId],
      limit: 1,
    );
    return res.isNotEmpty;
  }
}