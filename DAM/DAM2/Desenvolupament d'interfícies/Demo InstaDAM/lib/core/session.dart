/// lib/core/session.dart

class Session {
  static int? userId;
  static String? username;

  static bool get isLoggedIn => userId != null;

  static void clear() {
    userId = null;
    username = null;
  }
}