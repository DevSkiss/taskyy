import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:my_task_manager/app/app_config.dart';
import 'package:my_task_manager/features/home/data/data_source/local/task_data_source.dart';
import 'package:my_task_manager/features/home/data/repositories/task_repository_impl.dart';
import 'package:my_task_manager/features/home/domain/repositories/task_repository.dart';
import 'package:my_task_manager/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task_manager/services/cached_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init({
  required AppConfig config,
}) async {
  // Local Storage // Database
  // locator.registerSingleton(() => IsarService());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton<CachedService>(() => CachedServiceImpl());

  // API - Local or Remote
  locator.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(),
  );

  // Repository
  locator.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());

  // Blocs

  locator.registerFactory(() => HomeBloc());

  // Utils

  locator.registerLazySingleton(() => Logger(
        filter: ShowLogFilter(showLog: config.showLogs),
      ));
}

class ShowLogFilter extends LogFilter {
  ShowLogFilter({
    required this.showLog,
  });
  final bool showLog;
  @override
  bool shouldLog(LogEvent event) {
    return showLog;
  }
}
