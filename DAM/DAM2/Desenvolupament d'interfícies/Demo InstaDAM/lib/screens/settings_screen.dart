/// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';

import '../app.dart';
import '../core/constants.dart';
import '../core/session.dart';
import '../core/strings.dart';
import '../data/prefs/prefs_service.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkTheme = false;
  bool _notifications = true;
  String _lang = AppConstants.langES;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final theme = await PrefsService.getTheme();
    final lang = await PrefsService.getLanguage();
    final notif = await PrefsService.getNotifications();

    setState(() {
      _darkTheme = theme == AppConstants.darkTheme;
      _lang = lang;
      _notifications = notif;
      _loading = false;
    });
  }

  Future<void> _setTheme(bool dark) async {
    setState(() => _darkTheme = dark);
    await PrefsService.setTheme(dark ? AppConstants.darkTheme : AppConstants.lightTheme);

    // Aplicar al momento
    await App.of(context)?.refreshSettings();
  }

  Future<void> _setLanguage(String lang) async {
    setState(() => _lang = lang);
    await PrefsService.setLanguage(lang);

    // Aplicar al momento
    await App.of(context)?.refreshSettings();
  }

  Future<void> _setNotifications(bool enabled) async {
    setState(() => _notifications = enabled);
    await PrefsService.setNotifications(enabled);
  }

  Future<void> _logout() async {
    await PrefsService.clearSession();
    Session.clear();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final t = (String key) => AppStrings.tr(key, _lang);

    return Scaffold(
      appBar: AppBar(
        title: Text(t('settings')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text(t('theme')),
            value: _darkTheme,
            onChanged: _setTheme,
          ),
          const Divider(),

          SwitchListTile(
            title: Text(t('notifications')),
            value: _notifications,
            onChanged: _setNotifications,
          ),
          const Divider(),

          ListTile(
            title: Text(t('language')),
            trailing: DropdownButton<String>(
              value: _lang,
              items: const [
                DropdownMenuItem(
                  value: AppConstants.langES,
                  child: Text('ES'),
                ),
                DropdownMenuItem(
                  value: AppConstants.langEN,
                  child: Text('EN'),
                ),
              ],
              onChanged: (v) {
                if (v != null) _setLanguage(v);
              },
            ),
          ),

          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            label: Text(t('logout')),
          ),
        ],
      ),
    );
  }
}