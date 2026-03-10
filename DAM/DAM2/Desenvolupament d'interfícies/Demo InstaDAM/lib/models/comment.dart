/// lib/models/comment.dart

class Comment {
  final int? id;
  final int postId;
  final String username;
  final String text;
  final DateTime createdAt;

  Comment({
    this.id,
    required this.postId,
    required this.username,
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'username': username,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      postId: map['postId'],
      username: map['username'],
      text: map['text'],
      createdAt:
      DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}