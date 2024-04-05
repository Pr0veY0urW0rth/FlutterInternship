import 'package:flutter/material.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/core/utils/injections.dart';

import 'src/app.dart';

void main() async {
  await initInjections();
  AppRouter.instance;
  runApp(const MyApp());
}
