import 'package:auto_route/auto_route.dart';
import 'package:my_task_manager/features/home/presentation/screens/home.dart';
import 'package:my_task_manager/features/onboarding/presentation/screens/onboarding.dart';
import 'package:my_task_manager/routes/routes.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    CustomRoute<dynamic>(
      initial: true,
      path: Routes.onboardingPath,
      name: Routes.onboarding,
      page: Onboarding,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<dynamic>(
      initial: true,
      path: Routes.homePath,
      name: Routes.home,
      page: Home,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
)
class $AppRouter {}
