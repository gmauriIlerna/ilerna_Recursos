/// lib/screens/create_post_screen.dart

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/repositories/post_repository.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _repo = PostRepository();
  final _descCtrl = TextEditingController();

  bool _isSaving = false;
  String? _errorText;

  // Cargamos bytes del placeholder desde assets
  Future<Uint8List> _loadPlaceholderBytes() async {
    final data = await rootBundle.load('assets/images/placeholder.png');
    return data.buffer.asUint8List();
  }

  Future<void> _savePost() async {
    final desc = _descCtrl.text.trim();

    if (desc.isEmpty) {
      setState(() => _errorText = 'Introduce una descripción.');
      return;
    }

    setState(() {
      _isSaving = true;
      _errorText = null;
    });

    try {
      final bytes = await _loadPlaceholderBytes();

      await _repo.createPost(
        description: desc,
        imageBytes: bytes,
      );

      if (!mounted) return;

      // Avisamos al feed de que se ha creado un post
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorText = 'Error guardando post: $e';
        _isSaving = false;
      });
    }
  }

  @override
  void dispose() {
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'En esta versión simple, la imagen será un placeholder guardado como BLOB.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            if (_errorText != null)
              Text(
                _errorText!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 12),
            if (_isSaving)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _savePost,
                  child: const Text('Publicar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}