import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/prefs/prefs_service.dart';
import '../data/repositories/post_repository.dart';
import 'user_posts_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _postRepo = PostRepository();
  final _nameCtrl = TextEditingController();

  int _postCount = 0;
  bool _loading = true;
  String _profileName = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final userId = Session.userId;
    final savedName = await PrefsService.getProfileName();

    int count = 0;
    if (userId != null) {
      count = await _postRepo.getPostCountByUser(userId);
    }

    setState(() {
      _profileName = savedName ?? (Session.username ?? 'Sin nombre');
      _nameCtrl.text = _profileName;
      _postCount = count;
      _loading = false;
    });
  }

  Future<void> _saveProfileName() async {
    final newName = _nameCtrl.text.trim();
    if (newName.isEmpty) return;

    await PrefsService.setProfileName(newName);

    setState(() {
      _profileName = newName;
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nombre de perfil guardado')),
    );
  }

  void _openMyPosts() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UserPostsScreen()),
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final username = Session.username ?? 'Desconocido';

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 12),

            Text('Usuario: $username'),
            const SizedBox(height: 16),

            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre de perfil',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _saveProfileName,
              child: const Text('Guardar nombre'),
            ),

            const Divider(height: 32),

            InkWell(
              onTap: _openMyPosts,
              child: Text(
                'Posts: $_postCount (toca para verlos)',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}