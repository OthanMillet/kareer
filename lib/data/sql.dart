import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "kareer.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id VARCHAR PRIMARY KEY, last_name VARCHAR, first_name VARCHAR, email VARCHAR, picture VARCHAR )");
    print("Table is created");
  }

//insertion
  Future<int> saveUser(result) async {
    var dbClient = await db;
    var res = await dbClient.insert("User",result);
    return res;
  }
  //select
  Future getData(tbl) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tbl');
    // print(res);
    // print(res[0]);
    return res;
  }

  // //deletion
  Future<int> deleteUser() async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
}
