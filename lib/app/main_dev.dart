import 'package:flutter/material.dart';
import 'package:my_task_manager/app/app_config.dart';
import 'package:my_task_manager/app/common_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  commonMain(
    config: AppConfig(
      apiUrl: 'devBaseUrl',
      showLogs: true,
    ),
  );
}
