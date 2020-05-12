import 'dart:io';
import 'package:knebel_knotes/src/models/medications_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'medications_manager.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {


      await db.execute('CREATE TABLE Medication('
          'id TEXT PRIMARY KEY,'
          'cat TEXT,'
          'subCat TEXT,'
          'medName TEXT,'
          //'indications TEXT,'
          'indicationsComment TEXT,'
          //'sideEffects TEXT,'
          //'severeEffects TEXT,'
          'frequency TEXT,'
          'doseInit TEXT,'
          'doseInitComment TEXT,'
          'doseRange TEXT,'
          'doseRangeComment TEXT,'
          'maxDose TEXT,'
          'maxDoseForKids TEXT,'
          'blackBoxWarning TEXT,'
          'misc TEXT,'
          'equiv TEXT,'
          'amphWorkUp TEXT,'
          'mphWorkUp TEXT'
          ')');
        // await db.execute('CREATE TABLE indications('
        // 'medId INTEGER,'
        // 'indication TEXT,'
        // 'modifier TEXT'
        // ')');
        // await db.execute('CREATE TABLE sideEffects('
        // 'medId INTEGER,'
        // 'sideEffect TEXT,'
        // 'modifier TEXT'
        // ')');
        // await db.execute('CREATE TABLE severeEffects('
        // 'medId INTEGER,'
        // 'severeEffect TEXT,'
        // 'modifier TEXT'
        // ')');
    });
  }

  //Insert List into Medications
  
  createMedication(Medications newMedication) async {
    await deleteAllMedications();
    final db = await database;
    final res = await db.insert('Medication', newMedication.toJson());    
    return res;
  }

  //Delete all medications
  Future<int> deleteAllMedications() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Medication');

    return res;
  }

  Future<List<Medications>> getAllMedications() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM MEDICATION");

    List<Medications> list =
    res.isNotEmpty ? res.map((c) => Medications.fromJson(c)).toList() : [];

    return list;
  }

}