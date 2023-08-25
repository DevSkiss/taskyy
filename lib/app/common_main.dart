import 'package:flutter/material.dart';
import 'package:my_task_manager/app/app.dart';
import 'package:my_task_manager/app/app_config.dart';
import 'package:my_task_manager/core/dependency_injection.dart' as di;
import 'package:my_task_manager/core/isar/isar_service.dart';

void commonMain({required AppConfig config}) async {
  await di.init(config: config);
  await IsarService().initialize();
  runApp(App(config: config));
}
