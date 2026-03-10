/// lib/models/post_feed_item.dart

import 'dart:typed_data';

class PostFeedItem {
  final int postId;
  final int userId;
  final String username;
  final Uint8List imageBytes;
  final String description;
  final DateTime createdAt;

  final int likeCount;
  final int commentCount;
  final bool isLikedByMe;

  PostFeedItem({
    required this.postId,
    required this.userId,
    required this.username,
    required this.imageBytes,
    required this.description,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLikedByMe,
  });
}