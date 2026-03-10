/// lib/data/repositories/user_repository.dart

import '../db/app_database.dart';
import '../../models/user.dart';

class UserRepository {
  // Registrar usuario:
  // - devuelve el id del usuario creado
  // - si el username ya existe, devuelve null (para manejarlo fácil en UI)
  Future<int?> register(String username, String password) async {
    final db = await AppDatabase.instance.database;

    // Comprobamos si ya existe
    final existing = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );

    if (existing.isNotEmpty) {
      return null; // username repetido
    }

    final user = User(username: username, password: password);

    // Insertar y devolver ID
    final id = await db.insert('users', user.toMap());
    return id;
  }

  // Login:
  // - devuelve User si username+password coinciden
  // - si no coinciden, devuelve null
  Future<User?> login(String username, String password) async {
    final db = await AppDatabase.instance.database;

    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );

    if (result.isEmpty) return null;

    return User.fromMap(result.first);
  }

  // Buscar usuario por ID (útil para restaurar sesión)
  Future<User?> getById(int id) async {
    final db = await AppDatabase.instance.database;

    final result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return User.fromMap(result.first);
  }

  // Buscar usuario por username (a veces viene bien)
  Future<User?> getByUsername(String username) async {
    final db = await AppDatabase.instance.database;

    final result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return User.fromMap(result.first);
  }
}