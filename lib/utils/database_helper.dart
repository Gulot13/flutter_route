/*import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;
  DatabaseHelper._createInstance();

  String tabName = "task"; // Nom de la table
  String colId = "id"; // colonne
  String colDesc = "desc"; // colonne

  factory DatabaseHelper() {
    if (_databaseHelper == null) _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async{
    if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
  }

  Future<Database> initializeDatabase() async { // Pour créer la DB
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "task.db";

    var taskDatabase = openDatabase(path, version: 1, onCreate: _createDb); // Création de la db
    return taskDatabase;
  }

  void _createDb(Database db, int newVersion) async { // On design la DB
    await db.execute("CREATE TABLE $tabName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colDesc TEXT)"); 
  }
  
  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery("SELECT * FROM $tabName"); //MEME RÉSULTAT
    var result = await db.query(tabName);                       //MAIS PLUS COURT
    return result;
  }
  Future<int> insertTask(Task task) async{
    Database db = await this.database;
		var result = await db.insert(tabName, task.toMap());
		return result;
  }
}*/