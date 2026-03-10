/// lib/data/repositories/comment_repository.dart

import '../../models/comment.dart';
import '../db/app_database.dart';

class CommentRepository {
  /// Obtener comentarios de un post, ordenados del más nuevo al más antiguo
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final db = await AppDatabase.instance.database;

    final rows = await db.query(
      'comments',
      where: 'postId = ?',
      whereArgs: [postId],
      orderBy: 'createdAt DESC',
    );

    return rows.map((m) => Comment.fromMap(m)).toList();
  }

  /// Añadir un comentario a un post
  Future<void> addComment({
    required int postId,
    required String username,
    required String text,
  }) async {
    final db = await AppDatabase.instance.database;

    await db.insert('comments', {
      'postId': postId,
      'username': username,
      'text': text,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    });
  }
}