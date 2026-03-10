/// lib/widgets/post_card.dart

import 'dart:typed_data';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Uint8List imageBytes;
  final String username;
  final String description;
  final DateTime createdAt;

  final int likeCount;
  final bool isLikedByMe;
  final VoidCallback onToggleLike;

  final int commentCount;
  final VoidCallback onViewComments;

  const PostCard({
    super.key,
    required this.imageBytes,
    required this.username,
    required this.description,
    required this.createdAt,
    required this.likeCount,
    required this.isLikedByMe,
    required this.onToggleLike,
    required this.commentCount,
    required this.onViewComments,
  });

  String _formatDate(DateTime dt) {
    // Formato simple: dd/mm/yyyy hh:mm
    final dd = dt.day.toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final yyyy = dt.year.toString();
    final hh = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '$dd/$mm/$yyyy $hh:$min';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabecera: usuario + fecha
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  _formatDate(createdAt),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Imagen (BLOB)
          AspectRatio(
            aspectRatio: 1, // cuadrada, estilo Instagram
            child: Image.memory(
              imageBytes,
              fit: BoxFit.cover,
            ),
          ),

          // Botones: like + comentarios
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: onToggleLike,
                  icon: Icon(
                    isLikedByMe ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
                Text('$likeCount'),

                const Spacer(),

                TextButton(
                  onPressed: onViewComments,
                  child: Text('Ver comentarios ($commentCount)'),
                ),
              ],
            ),
          ),

          // Descripción
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}