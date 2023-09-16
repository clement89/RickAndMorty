import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_morty/app/app.dart';
import 'package:rick_morty/core/logs/log_service.dart';
import 'package:rick_morty/core/storage/models/character.dart';
import 'package:rick_morty/core/storage/models/character_location.dart';
import 'package:rick_morty/core/storage/models/character_origin.dart';
import 'package:rick_morty/di/injection_container.dart';

void main() async {
  await setupInjection();
  final logService = serviceLocator<LogService>();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    await Hive.initFlutter();
    Hive.registerAdapter(CharacterAdapter());
    Hive.registerAdapter(CharacterOriginAdapter());
    Hive.registerAdapter(CharacterLocationAdapter());

    runApp(MyApp());
  }, (error, stackTrace) {
    logService.logError('This is an error message.');
  });
}
