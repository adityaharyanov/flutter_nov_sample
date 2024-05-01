import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_nov_trial/app.dart';
import 'package:flutter_nov_trial/data/services/database/database.service.dart';
import 'package:flutter_nov_trial/packages/drift/drift.package.dart';
import 'package:flutter_nov_trial/utils/global.dart';

import 'packages/sqflite/sqflite.package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  var _ = Global.instance;

  // delay to wait GLobal instance to be initialized
  await Future.delayed(const Duration(seconds: 1));

  runApp(const App());

}
