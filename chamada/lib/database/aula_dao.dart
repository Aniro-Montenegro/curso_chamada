import 'package:chamada/models/aula_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AulaDao {
  static const String tableName = 'aula';
  static const String columnId = 'id';
  static const String columnTema = 'tema';
  static const String columnProfessorId = 'professor_id';
  static const String columnData = 'data';

  Future<Database> get database async {
    final String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'aula.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName('
          '$columnId INTEGER PRIMARY KEY, '
          '$columnTema TEXT, '
          '$columnProfessorId INTEGER, '
          '$columnData TEXT'
          ')',
        );
      },
      version: 1,
    );
  }

  Future<void> save(AulaModel aula) async {
    final db = await database;
    await db.insert(
      tableName,
      aula.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AulaModel>> findAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(
      maps.length,
      (i) => AulaModel(
        maps[i][columnId],
        maps[i][columnTema],
        maps[i][columnProfessorId],
        maps[i][columnData],
      ),
    );
  }

  Future<void> update(AulaModel aula) async {
    final db = await database;
    await db.update(
      tableName,
      aula.toJson(),
      where: '$columnId = ?',
      whereArgs: [aula.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
