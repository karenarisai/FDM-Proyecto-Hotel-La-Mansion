import '../models/cliente.dart';
import '../../../core/database/database_helper.dart';

class LocalClienteService {
  final dbHelper = DatabaseHelper.instance; 

  //crear
  Future<int> insertCliente(Cliente cliente) async {
    final db = await dbHelper.database;
    return await db.insert('huespedes', cliente.toMap());
  }

  //Lectura, se lee como una coleccion de diccionarios
  Future<List<Cliente>> getClientes() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('huespedes');

    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }


  //Eliminacion
  Future<int> deleteWorkout(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'workouts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//Edicion
  Future<int> updateWorkout(Cliente cliente) async {
    final db = await dbHelper.database;
    return await db.update(
      'huespedes',
      cliente.toMap(),
      where: 'id = ?',
      whereArgs: [cliente.id],
    );
  }

}