import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

@DriftDatabase()
class SQLDatabase extends _$SQLDatabase {
  final String dbName;

  SQLDatabase({required this.dbName}) : super(_openConnection(dbName));

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(String dbName) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, dbName));

    return NativeDatabase.createInBackground(file);
  });
}
