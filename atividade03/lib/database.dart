import 'package:atividade03/gasto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'gastos.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE Gastos(id INTEGER PRIMARY KEY AUTOINCREMENT, gastoCategoria TEXT NOT NULL, gastoDescricao TEXT NOT NULL, gastoValor INT NOT NULL)");
      },
      version: 1,
    );
  }

  Future<void> insertGasto(Gasto gasto) async {
    final db = await initializeDB();
    await db.insert('Gastos', gasto.toMap());
  }

  Future<List<Gasto>> listGastos() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('Gastos');
    return List.generate(result.length, (index) {
      return Gasto(
        id: result[index]['id'],
        gastoCategoria: result[index]['gastoCategoria'],
        gastoDescricao: result[index]['gastoDescricao'],
        gastoValor: result[index]['gastoValor'].toDouble(),
      );
    });
  }

  Future<void> updateGasto(int id, Gasto gasto) async {
    final db = await initializeDB();
    await db.update('Gastos', gasto.toMap(), where: "id = ?", whereArgs: [id]);
  }

  Future<void> removeGasto(int id) async {
    final db = await initializeDB();
    await db.delete("Gastos",where: "id=?", whereArgs: [id]);
  }

}