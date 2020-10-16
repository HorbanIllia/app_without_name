import 'dart:io';

import 'package:app_without_name/models/emergency.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'emergency_db.db');
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Emergency ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "description TEXT,"
          "type INTEGER,"
          "coordinates TEXT,"
          "photo TEXT"
          ")");
    });
  }

  newEmergency(Emergency emergency) async {
    final db = await database;

    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Emergency");
    int id = table.first["id"];

    var raw = await db.rawInsert(
        "INSERT Into Emergency (id,name,description,type,coordinates,photo)"
            " VALUES (?,?,?,?,?,?)",
        [id, emergency.name, emergency.description, emergency.type, emergency.coordinates, emergency.photo]);
    return raw;
  }

  Future<List<Emergency>> getAllEmergency() async {
    final db = await database;
    var res = await db.query("Emergency");
    List<Emergency> list = res.isNotEmpty ? res.map((c) => Emergency.fromMap(c)).toList() : [];
    return list;
  }

  deleteEmergency(int id) async {
    final db = await database;
    return db.delete("Emergency", where: "id = ?", whereArgs: [id]);
  }
}