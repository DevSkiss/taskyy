import 'package:flutter/widgets.dart';
import 'package:my_task_manager/app/app_config.dart';
import 'package:my_task_manager/app/common_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  commonMain(
    config: AppConfig(
      apiUrl: 'prodBaseUrl',
      showLogs: false,
    ),
  );
}
