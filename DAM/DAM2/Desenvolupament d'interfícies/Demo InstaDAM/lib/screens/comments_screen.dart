/// lib/screens/comments_screen.dart

import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/repositories/comment_repository.dart';
import '../models/comment.dart';

class CommentsScreen extends StatefulWidget {
  final int postId;

  const CommentsScreen({
    super.key,
    required this.postId,
  });

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _repo = CommentRepository();
  final _textCtrl = TextEditingController();

  late Future<List<Comment>> _commentsFuture;
  bool _isSending = false;
  bool _didChange = false; // para avisar al feed al volver

  @override
  void initState() {
    super.initState();
    _reloadComments();
  }

  void _reloadComments() {
    _commentsFuture = _repo.getCommentsByPostId(widget.postId);
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendComment() async {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;

    final username = Session.username ?? 'Anonimo';

    setState(() => _isSending = true);

    await _repo.addComment(
      postId: widget.postId,
      username: username,
      text: text,
    );

    _textCtrl.clear();

    setState(() {
      _isSending = false;
      _didChange = true;
      _reloadComments();
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context, _didChange);
    return false;
  }

  String _formatDate(DateTime dt) {
    final dd = dt.day.toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final yyyy = dt.year.toString();
    final hh = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '$dd/$mm/$yyyy $hh:$min';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comentarios (Post ${widget.postId})'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, _didChange),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Comment>>(
                future: _commentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error cargando comentarios: ${snapshot.error}'),
                    );
                  }

                  final comments = snapshot.data ?? [];

                  if (comments.isEmpty) {
                    return const Center(
                      child: Text('No hay comentarios todavía.\n¡Sé el primero!'),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: comments.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final c = comments[index];

                      return ListTile(
                        title: Text(c.username),
                        subtitle: Text(c.text),
                        trailing: Text(
                          _formatDate(c.createdAt),
                          style: const TextStyle(fontSize: 11),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Caja de texto para escribir comentario
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textCtrl,
                        decoration: const InputDecoration(
                          hintText: 'Escribe un comentario...',
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _isSending
                        ? const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    )
                        : IconButton(
                      onPressed: _sendComment,
                      icon: const Icon(Icons.send),
                      tooltip: 'Enviar',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}