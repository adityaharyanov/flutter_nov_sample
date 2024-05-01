import 'package:flutter_nov_trial/packages/drift/database.dart';

class DriftPackage {
  late final SQLDatabase database;

  DriftPackage();

  Future init(String databaseName) async {
    database = SQLDatabase(dbName: databaseName);
  }
}
