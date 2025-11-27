import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileDatabase {
  // ---------------------------------------------------------
  //   Creación del patrón Singleton
  // ---------------------------------------------------------
  static final ProfileDatabase instance = ProfileDatabase._init();

  static Database? _database;

  ProfileDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("perfil.db");
    return _database!;
  }

  // ---------------------------------------------------------
  //   Inicialización de la BD
  // ---------------------------------------------------------
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE perfil(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        color TEXT,
        aplicado INTEGER
      )
    ''');
  }

  // ---------------------------------------------------------
  //   Cargar perfil (retorna un Map<String, dynamic>?)
  // ---------------------------------------------------------
  Future<Map<String, dynamic>?> getProfile() async {
    final db = await instance.database;

    final result = await db.query("perfil", limit: 1);

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  // ---------------------------------------------------------
  //   Guardar o actualizar perfil
  // ---------------------------------------------------------
  Future<void> saveProfile({
    required String nombre,
    required String color,
    required bool aplicado,
  }) async {
    final db = await instance.database;

    final existing = await db.query("perfil", limit: 1);

    final data = {
      "nombre": nombre,
      "color": color,
      "aplicado": aplicado ? 1 : 0,
    };

    if (existing.isEmpty) {
      await db.insert("perfil", data);
    } else {
      await db.update(
        "perfil",
        data,
        where: "id = ?",
        whereArgs: [existing.first["id"]],
      );
    }
  }

  // ---------------------------------------------------------
  //   Cerrar BD
  // ---------------------------------------------------------
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}