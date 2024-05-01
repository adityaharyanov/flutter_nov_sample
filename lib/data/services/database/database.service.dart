import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';
import 'package:flutter_nov_trial/data/repositories/pocket.repository.dart';
import 'package:flutter_nov_trial/data/services/database/entities/pocket.entity.dart';
import 'package:flutter_nov_trial/data/services/database/table_name.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
// import 'package:flutter_nov_trial/packages/drift/drift.package.dart';
import 'package:flutter_nov_trial/packages/sqflite/sqflite.package.dart';

class DatabaseService implements PocketDataService, ActivityDataService {
  SQflitePackage package;

  // Uncomment this section if you want to use Drift
  // DriftPackage package;

  final String _version = '1.0';

  String get _databaseName {
    return 'data_$_version.db3';
  }

  int limit = 10;

  DatabaseService(this.package);

  Future init() {
    return package.init(_databaseName);
  }

  // PocketDataService

  @override
  Future<bool> insertPocket(Map<String, Object?> pocket) {
    return package.insert(
      table: TableName.pocket.value,
      value: pocket,
    );
  }

  @override
  Future<List<Map<String, Object?>>> getAllPockets({int page = 1}) async {
    var sql =
        'SELECT * FROM ${TableName.pocket.value} LIMIT $limit'; // OFFSET ${page * 10}';
    var result = await package.raw(sql);
    return result;
  }

  // ActivityDataService

  @override
  Future<List<Map<String, Object?>>> getAllActivities({int page = 1}) async {
    var sql =
        'SELECT * FROM ${TableName.activity.value} LIMIT $limit'; // OFFSET ${page * 10}';
    var result = await package.raw(sql);
    return result;
  }

  @override
  Future<bool> insertActivity(Map<String, Object?> data) {
    return package.insert(
      table: TableName.activity.value,
      value: data,
    );
  }
}
