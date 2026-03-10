/// lib/models/post.dart

import 'dart:typed_data';

class Post {
  final int? id;
  final int userId;
  final Uint8List imageBytes;
  final String description;
  final DateTime createdAt;

  Post({
    this.id,
    required this.userId,
    required this.imageBytes,
    required this.description,
    required this.createdAt,
  });

  // Objeto → Map (para SQFlite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'imageBlob': imageBytes,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  // Map → Objeto
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userId: map['userId'],
      imageBytes: map['imageBlob'],
      description: map['description'],
      createdAt:
      DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}