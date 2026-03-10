/// lib/data/db/app_database.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  AppDatabase._(); // Constructor privado (Singleton)

  static final AppDatabase instance = AppDatabase._();

  static Database? _database;

  // Nombre y versión de la BD
  static const String _dbName = 'instadam.db';
  static const int _dbVersion = 1;

  // Acceso a la BD (abre si hace falta)
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _openDatabase();
    return _database!;
  }

  Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tabla users
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      );
    ''');

    // Tabla posts (con imagen como BLOB)
    await db.execute('''
      CREATE TABLE posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        imageBlob BLOB NOT NULL,
        description TEXT NOT NULL,
        createdAt INTEGER NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(id)
      );
    ''');

    // Tabla likes (un usuario solo puede dar 1 like a un post)
    await db.execute('''
      CREATE TABLE likes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        postId INTEGER NOT NULL,
        userId INTEGER NOT NULL,
        createdAt INTEGER NOT NULL,
        UNIQUE(postId, userId),
        FOREIGN KEY (postId) REFERENCES posts(id),
        FOREIGN KEY (userId) REFERENCES users(id)
      );
    ''');

    // Tabla comments
    await db.execute('''
      CREATE TABLE comments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        postId INTEGER NOT NULL,
        username TEXT NOT NULL,
        text TEXT NOT NULL,
        createdAt INTEGER NOT NULL,
        FOREIGN KEY (postId) REFERENCES posts(id)
      );
    ''');

    // Índices (opcional pero ayuda a que vaya más fluido)
    await db.execute('CREATE INDEX idx_posts_userId ON posts(userId);');
    await db.execute('CREATE INDEX idx_likes_postId ON likes(postId);');
    await db.execute('CREATE INDEX idx_comments_postId ON comments(postId);');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // De momento no hay upgrades porque estamos en versión 1.
    // Cuando hagamos cambios en tablas, aquí pondremos migraciones.
    //
    // Ejemplo típico:
    // if (oldVersion < 2) {
    //   await db.execute('ALTER TABLE posts ADD COLUMN ...');
    // }
  }

  // Cerrar la BD (opcional, normalmente no hace falta llamarlo)
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}