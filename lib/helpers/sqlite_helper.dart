import 'package:path/path.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';

class SqliteHelper {

  Future<Database> openData() async {

    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'menuItem_database.db');

    Database database = await openDatabase(
      dbPath,
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE menuItem(id INTEGER PRIMARY KEY , name TEXT, photo TEXT, price INTEGER, quantity INTEGER)',
        );
      },
    );

    return database;
  }

  Future<MenuItem?> getMenuItemById(int id) async {
    final db = await openData();

    List<Map<String, dynamic>> result = await db.query(
      'menuItem',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return MenuItem(
        id: result[0]['id'],
        name: result[0]['name'],
        photo: result[0]['photo'],
        price: result[0]['price'],
        quantity: result[0]['quantity'],
      );
    } else {
      return null;
    }
  }


  Future<void> insertMenuItem(MenuItem menuItem) async {
    final db = await openData();

    await db.insert('menuItem', menuItem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MenuItem>> menuItems() async {
    final db = await openData();

    final List<Map<String, dynamic>> maps = await db.query('menuItem');

    return List.generate(maps.length, (i) {
      return MenuItem(
          id: maps[i]['id'],
          name: maps[i]['name'],
          photo: maps[i]['photo'],
          price: maps[i]['price'],
          quantity: maps[i]['quantity'],
      );
    });
  }

  Future<void> updateMenuItem(MenuItem menuItem) async {
    final db = await openData();
    await db.update('menuItem', menuItem.toMap(), where: 'id=?', whereArgs: [menuItem.id]);
  }

  Future<void> deleteNote(int id) async{
    final db = await openData();
    await db.delete(
        'menuItem',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<bool> isMenuItemExists(int id) async {
    final db = await openData();

    List<Map<String, dynamic>> result = await db.query(
      'menuItem',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty;
  }

  Future<void> deleteAllMenuItems() async {
    final db = await openData();
    await db.delete('menuItem');
  }

}
