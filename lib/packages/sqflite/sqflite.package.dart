import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class SQflitePackage {
  Database? _instance;
  Database get instance => _instance!;
  final int _version = 1;

  Future init(String dbName) async {}

  Future<List<Map<String, Object?>>> raw(String sql,
      [List<Object?>? arguments]) async {
    var result = await instance.rawQuery(sql, arguments);
    return result;
  }

  Future<bool> insert(
      {required String table,
      required Map<String, Object?> value,
      String? nullColumnHack,
      ConflictAlgorithm? conflictAlgorithm = ConflictAlgorithm.fail}) async {
    var result = await instance.insert(table, value,
        conflictAlgorithm: conflictAlgorithm, nullColumnHack: nullColumnHack);

    return result > 0;
  }

  Future<bool> update(
      {required String table,
      required Map<String, Object?> values,
      String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm =
          ConflictAlgorithm.rollback}) async {
    var result = await instance.update(table, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: conflictAlgorithm);

    return result > 0;
  }

  Future<bool> delete(
      {required String table, String? where, List<Object?>? whereArgs}) async {
    var result =
        await instance.delete(table, where: where, whereArgs: whereArgs);

    return result > 0;
  }
}
