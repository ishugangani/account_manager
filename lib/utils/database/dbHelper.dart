import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? database;
  String tableName = "Transaction";
  String c_amount = "Amount";
  String c_cate = "Category";
  String c_note = "Notes";
  String c_paytype = "PayType";
  String c_date = "Date";
  String c_time = "Time";
  String c_status = "Status";

  static DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "database.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, $c_cate TEXT ,$c_amount TEXT, $c_note TEXT, $c_paytype TEXT, $c_date TEXT,, $c_time TEXT,, $c_status INTEGER)";
        database!.execute(query);
      },
    );
  }
  
  Future<void> inserDB({required amount, required cate, required notes, required paytype, required date, required time, required status})
  async {
    database = await checkDB();
    database!.insert(tableName, {
      c_amount: amount,
      c_cate: cate,
      c_note: notes,
      c_paytype: paytype,
      c_date: date,
      c_time: time,
      c_status: status,
    });
  }

  Future<List<Map>> readDB()
  async {
    database = await checkDB();
    String query = "SELECT * FROM $tableName";

    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }

  Future<void> deleteDB(id)
  async {
    database = await checkDB();
    database!.delete(tableName,where: "id=?",whereArgs: [id]);
  }
}
