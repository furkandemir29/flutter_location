import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/LocationModel.dart';

class DatabaseHelper{

  static const int _version =1;
  static const String _dbName ="Location.db";


  static Future<Database> _getDB()  async {
    return openDatabase(join(await getDatabasesPath(),_dbName),
      onCreate: (db,version) async =>
          await db.execute("CREATE TABLE Location(lat TEXT NOT NULL,long TEXT NOT NULL);"),
      version: _version
    );
}
  static Future<int> addLocation(LocationModel locationModel) async{
    final db = await _getDB();
    return await db.insert("Location", locationModel.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<LocationModel>?> getAllLocation() async{
    final db = await _getDB();

    final List<Map<String,dynamic>> maps = await db.query("Location");
   if(maps.isEmpty){
     return null;
   }


   return List.generate(maps.length, (index) => LocationModel.fromJson(maps[index]));
  }


}