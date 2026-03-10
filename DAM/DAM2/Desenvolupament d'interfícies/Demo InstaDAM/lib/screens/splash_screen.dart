/// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';

import '../core/session.dart';
import '../data/prefs/prefs_service.dart';

// Estas pantallas las crearemos en pasos posteriores.
import 'login_screen.dart';
import 'feed_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _decideNextScreen();
  }

  Future<void> _decideNextScreen() async {
    final remember = await PrefsService.shouldRememberUser();

    if (!remember) {
      _goToLogin();
      return;
    }

    final userId = await PrefsService.getSavedUserId();
    final username = await PrefsService.getSavedUsername();

    if (userId == null || username == null) {
      _goToLogin();
      return;
    }

    // Restauramos sesión en memoria
    Session.userId = userId;
    Session.username = username;

    _goToFeed();
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _goToFeed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const FeedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}