/// lib/data/prefs/prefs_service.dart

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';

class PrefsService {
  static Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  // --------- USER SESSION ---------

  static Future<void> saveUserSession({
    required int userId,
    required String username,
    required bool remember,
  }) async {
    final prefs = await _prefs();
    await prefs.setBool(AppConstants.rememberUser, remember);

    if (remember) {
      await prefs.setInt(AppConstants.userId, userId);
      await prefs.setString(AppConstants.username, username);
    }
  }

  static Future<void> clearSession() async {
    final prefs = await _prefs();
    await prefs.remove(AppConstants.rememberUser);
    await prefs.remove(AppConstants.userId);
    await prefs.remove(AppConstants.username);
  }

  static Future<bool> shouldRememberUser() async {
    final prefs = await _prefs();
    return prefs.getBool(AppConstants.rememberUser) ?? false;
  }

  static Future<int?> getSavedUserId() async {
    final prefs = await _prefs();
    return prefs.getInt(AppConstants.userId);
  }

  static Future<String?> getSavedUsername() async {
    final prefs = await _prefs();
    return prefs.getString(AppConstants.username);
  }

  // --------- THEME ---------

  static Future<void> setTheme(String theme) async {
    final prefs = await _prefs();
    await prefs.setString(AppConstants.themeMode, theme);
  }

  static Future<String> getTheme() async {
    final prefs = await _prefs();
    return prefs.getString(AppConstants.themeMode) ??
        AppConstants.lightTheme;
  }

  // --------- LANGUAGE ---------

  static Future<void> setLanguage(String lang) async {
    final prefs = await _prefs();
    await prefs.setString(AppConstants.language, lang);
  }

  static Future<String> getLanguage() async {
    final prefs = await _prefs();
    return prefs.getString(AppConstants.language) ??
        AppConstants.langES;
  }

  // --------- PROFILE ---------

  static Future<void> setProfileName(String name) async {
    final prefs = await _prefs();
    await prefs.setString(AppConstants.profileName, name);
  }

  static Future<String?> getProfileName() async {
    final prefs = await _prefs();
    return prefs.getString(AppConstants.profileName);
  }

  static Future<void> setProfilePhoto(String path) async {
    final prefs = await _prefs();
    await prefs.setString(AppConstants.profilePhoto, path);
  }

  static Future<String?> getProfilePhoto() async {
    final prefs = await _prefs();
    return prefs.getString(AppConstants.profilePhoto);
  }

  // --------- NOTIFICATIONS ---------

  static Future<void> setNotifications(bool enabled) async {
    final prefs = await _prefs();
    await prefs.setBool(AppConstants.notificationsEnabled, enabled);
  }

  static Future<bool> getNotifications() async {
    final prefs = await _prefs();
    return prefs.getBool(AppConstants.notificationsEnabled) ?? true;
  }
}