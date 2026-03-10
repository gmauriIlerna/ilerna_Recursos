import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/prefs/prefs_service.dart';
import '../data/repositories/post_repository.dart';
import '../models/post_feed_item.dart';
import '../widgets/post_card.dart';

import 'login_screen.dart';
import 'create_post_screen.dart';
import 'comments_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final _repo = PostRepository();
  late Future<List<PostFeedItem>> _feedFuture;

  @override
  void initState() {
    super.initState();
    _reloadFeed();
  }

  void _reloadFeed() {
    _feedFuture = _repo.getFeed();
  }

  Future<void> _logout() async {
    await PrefsService.clearSession();
    Session.clear();

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  Future<void> _toggleLike(int postId) async {
    await _repo.toggleLike(postId);
    setState(_reloadFeed);
  }

  Future<void> _viewComments(int postId) async {
    final changed = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CommentsScreen(postId: postId)),
    );

    if (changed == true) {
      setState(_reloadFeed);
    }
  }

  Future<void> _openCreatePost() async {
    final created = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreatePostScreen()),
    );

    if (created == true) {
      setState(_reloadFeed);
    }
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myName = Session.username ?? 'Desconocido';

    return Scaffold(
      appBar: AppBar(
        title: Text('Feed - $myName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Perfil',
            onPressed: _openProfile,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
            onPressed: _openSettings,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<List<PostFeedItem>>(
        future: _feedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error cargando feed: ${snapshot.error}'),
            );
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text(
                'No hay posts todavía.\nPulsa + para crear uno.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final p = items[index];

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
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreatePost,
        child: const Icon(Icons.add),
      ),
    );
  }
}