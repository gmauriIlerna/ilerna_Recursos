/// lib/screens/login_screen.dart

import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/prefs/prefs_service.dart';
import '../data/repositories/user_repository.dart';
import 'feed_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _repo = UserRepository();

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _remember = false;
  bool _isLoading = false;
  String? _errorText;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() => _errorText = 'Introduce usuario y contraseña.');
      return false;
    }
    if (password.length < 3) {
      setState(() => _errorText = 'La contraseña es demasiado corta.');
      return false;
    }

    setState(() => _errorText = null);
    return true;
  }

  Future<void> _doLogin() async {
    if (!_validateInputs()) return;

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text.trim();

    try {
      final user = await _repo.login(username, password);

      if (!mounted) return;

      if (user == null) {
        setState(() {
          _errorText = 'Credenciales incorrectas.';
          _isLoading = false;
        });
        return;
      }

      // Guardar sesión en memoria
      Session.userId = user.id;
      Session.username = user.username;

      // Guardar prefs si quiere recordar
      await PrefsService.saveUserSession(
        userId: user.id!,
        username: user.username,
        remember: _remember,
      );

      // (Opcional) Si todavía no hay profileName, ponemos el username como nombre
      final currentProfileName = await PrefsService.getProfileName();
      currentProfileName ?? await PrefsService.setProfileName(user.username);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FeedScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorText = 'Error inesperado: $e';
        _isLoading = false;
      });
      return;
    }

    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  Future<void> _doRegister() async {
    if (!_validateInputs()) return;

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text.trim();

    try {
      final newId = await _repo.register(username, password);

      if (!mounted) return;

      if (newId == null) {
        setState(() {
          _errorText = 'Ese usuario ya existe. Prueba otro.';
          _isLoading = false;
        });
        return;
      }

      // Auto-login tras registrar (muy cómodo para el alumno)
      Session.userId = newId;
      Session.username = username;

      await PrefsService.saveUserSession(
        userId: newId,
        username: username,
        remember: _remember,
      );

      // Guardamos nombre de perfil por defecto
      await PrefsService.setProfileName(username);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FeedScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorText = 'Error inesperado: $e';
        _isLoading = false;
      });
      return;
    }

    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InstaDAM - Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _usernameCtrl,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordCtrl,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onSubmitted: (_) => _doLogin(),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Checkbox(
                  value: _remember,
                  onChanged: (v) => setState(() => _remember = v ?? false),
                ),
                const Text('Recordar usuario'),
              ],
            ),

            if (_errorText != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorText!,
                style: const TextStyle(color: Colors.red),
              ),
            ],

            const SizedBox(height: 12),

            if (_isLoading)
              const CircularProgressIndicator()
            else
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _doLogin,
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _doRegister,
                      child: const Text('Registro'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}