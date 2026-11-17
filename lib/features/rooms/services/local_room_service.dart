import '../models/room_model.dart';
import '../../../core/database/database_helper.dart';

class LocalRoomService {
  final dbHelper = DatabaseHelper.instance;

  // Create
  Future<int> insertRoom(RoomModel room) async {
    final db = await dbHelper.database;
    return await db.insert('rooms', room.toMap());
  }

  // Read
  Future<List<RoomModel>> getRooms() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('rooms');

    return List.generate(maps.length, (i) {
      return RoomModel.fromMap(maps[i]);
    });
  }

  // Update
  Future<int> updateRoom(RoomModel room) async {
    final db = await dbHelper.database;
    return await db.update(
      'rooms',
      room.toMap(),
      where: 'id = ?',
      whereArgs: [room.id],
    );
  }

  // Delete
  Future<int> deleteRoom(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'rooms',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}