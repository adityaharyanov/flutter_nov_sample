import 'package:flutter_nov_trial/data/services/database/database.service.dart';
import 'package:flutter_nov_trial/data/services/memory/activity_data.service.dart';
import 'package:flutter_nov_trial/data/services/memory/pocket_data.service.dart';
import 'package:flutter_nov_trial/packages/drift/drift.package.dart';
import 'package:flutter_nov_trial/packages/sqflite/sqflite.package.dart';

class Global {
  static final Global _instance = Global();
  static Global get instance => _instance;

  var activityDataService = ActivityMemoryDataService();
  var pocketDataService = PocketMemoryDataService();

  late SQflitePackage _sqflite;
  late DatabaseService dbService;

  Global() {
    _init();
  }
  _init() async {
    _sqflite = SQflitePackage();
    dbService = DatabaseService(_sqflite);
    await dbService.init();
  }

  // Uncomment this section if you want to use Drift
  // and Uncomment on the `DatabaseService` class
  // late DriftPackage _drift;
  // late DatabaseService dbService;

  // Global() {
  //   _init();
  // }
  // _init() async {
  //   _drift = DriftPackage();
  //   dbService = DatabaseService(_drift);
  //   await dbService.init();
  // }
}
