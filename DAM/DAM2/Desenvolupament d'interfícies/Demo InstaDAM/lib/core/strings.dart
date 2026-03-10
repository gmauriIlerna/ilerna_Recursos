/// lib/core/strings.dart

class AppStrings {
  // Mapa simple: clave -> { idioma -> texto }
  static const Map<String, Map<String, String>> _t = {
    'settings': {
      'es': 'Configuración',
      'en': 'Settings',
    },
    'theme': {
      'es': 'Tema oscuro',
      'en': 'Dark theme',
    },
    'notifications': {
      'es': 'Notificaciones (simulación)',
      'en': 'Notifications (simulation)',
    },
    'language': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'logout': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    'saved': {
      'es': 'Guardado',
      'en': 'Saved',
    },
  };

  static String tr(String key, String lang) {
    return _t[key]?[lang] ?? _t[key]?['es'] ?? key;
  }
}