/// lib/app.dart

import 'package:flutter/material.dart';
import 'data/prefs/prefs_service.dart';
import 'core/constants.dart';
import 'screens/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  static _AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale(AppConstants.langES);

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final theme = await PrefsService.getTheme();
    final lang = await PrefsService.getLanguage();

    setState(() {
      _themeMode = (theme == AppConstants.darkTheme)
          ? ThemeMode.dark
          : ThemeMode.light;

      _locale = Locale(lang);
    });
  }

  Future<void> refreshSettings() async {
    await _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaDAM',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      locale: _locale,
      home: const SplashScreen(),
    );
  }
}