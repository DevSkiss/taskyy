import 'package:flutter/material.dart';
import 'package:my_task_manager/app/app_config.dart';
import 'package:my_task_manager/routes/app_router.gr.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Taskyy',
    );
  }
}
