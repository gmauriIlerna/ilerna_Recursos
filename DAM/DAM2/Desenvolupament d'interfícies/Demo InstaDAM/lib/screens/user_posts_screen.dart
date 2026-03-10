/// lib/screens/user_posts_screen.dart

import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/repositories/post_repository.dart';
import '../models/post_feed_item.dart';
import '../widgets/post_card.dart';
import 'comments_screen.dart';

class UserPostsScreen extends StatefulWidget {
  const UserPostsScreen({super.key});

  @override
  State<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen> {
  final _repo = PostRepository();
  late Future<List<PostFeedItem>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    final userId = Session.userId;
    _future = _repo.getFeed(onlyUserId: userId);
  }

  Future<void> _toggleLike(int postId) async {
    await _repo.toggleLike(postId);
    setState(_reload);
  }

  Future<void> _viewComments(int postId) async {
    final changed = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CommentsScreen(postId: postId)),
    );

    if (changed == true) {
      setState(_reload);
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = Session.username ?? 'Mis posts';

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts de $username'),
        actions: [
          IconButton(
            onPressed: () => setState(_reload),
            icon: const Icon(Icons.refresh),
            tooltip: 'Recargar',
          ),
        ],
      ),
      body: FutureBuilder<List<PostFeedItem>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text('Aún no has creado posts.'),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final p = items[i];

              return PostCard(
                imageBytes: p.imageBytes,
                username: p.username,
                description: p.description,
                createdAt: p.createdAt,
                likeCount: p.likeCount,
                isLikedByMe: p.isLikedByMe,
                onToggleLike: () => _toggleLike(p.postId),
                commentCount: p.commentCount,
                onViewComments: () => _viewComments(p.postId),
              );
            },
          );
        },
      ),
    );
  }
}