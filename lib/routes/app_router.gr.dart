// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../features/home/presentation/screens/home.dart' as _i2;
import '../features/onboarding/presentation/screens/onboarding.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    OnboardingRouter.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.Onboarding(),
        transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
        transitionsBuilder: _i3.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          OnboardingRouter.name,
          path: '/',
        ),
        _i3.RouteConfig(
          HomeRouter.name,
          path: '/home',
        ),
      ];
}

/// generated route for
/// [_i1.Onboarding]
class OnboardingRouter extends _i3.PageRouteInfo<void> {
  const OnboardingRouter()
      : super(
          OnboardingRouter.name,
          path: '/',
        );

  static const String name = 'OnboardingRouter';
}

/// generated route for
/// [_i2.Home]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/home',
        );

  static const String name = 'HomeRouter';
}
