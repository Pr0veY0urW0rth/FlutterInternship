import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/core/utils/injections.dart';

import 'src/app.dart';

void main() async {
  initInjections();
  AppRouter.instance;
  await Hive.initFlutter();
  runApp(MyApp());
}
