import 'package:chamada/models/aluno_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AlunoDao {
  static const String tableName = 'aluno';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnTelefone = 'telefone';
  static const String columnCpf = 'cpf';
  static const String columnRg = 'rg';
  static const String columnDataNascimento = 'data_nascimento';
  static const String columnSexo = 'sexo';

  Future<Database> get database async {
    final String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'aluno.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName('
          '$columnId INTEGER PRIMARY KEY, '
          '$columnName TEXT, '
          '$columnTelefone TEXT, '
          '$columnCpf TEXT, '
          '$columnRg TEXT, '
          '$columnDataNascimento TEXT, '
          '$columnSexo TEXT'
          ')',
        );
      },
      version: 1,
    );
  }

  Future<bool> save(AlunoModel aluno) async {
    final db = await database;
    try {
      await db.insert(
        tableName,
        aluno.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<AlunoModel>> findAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(
      maps.length,
      (i) => AlunoModel(
        maps[i][columnId],
        maps[i][columnName],
        maps[i][columnTelefone],
        maps[i][columnCpf],
        maps[i][columnRg],
        maps[i][columnDataNascimento],
        maps[i][columnSexo],
      ),
    );
  }

  Future<void> update(AlunoModel aluno) async {
    final db = await database;
    await db.update(
      tableName,
      aluno.toJson(),
      where: '$columnId = ?',
      whereArgs: [aluno.id],
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
