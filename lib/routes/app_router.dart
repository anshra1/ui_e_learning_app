import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_e_learning_app/modules/menus/home_view/home_view.dart';
import 'package:ui_e_learning_app/routes/app_nav_bar.dart';
import 'package:ui_e_learning_app/routes/app_routes.dart';

class AppRouter {
  static GoRouter get router => _router;

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static GlobalKey<NavigatorState> get mainMenuNavigatorKey =>
      _mainMenuNavigatorKey;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main-menu');

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomeView.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _mainMenuNavigatorKey,
        builder: (_, state, child) {
          return AppNavBar(child: child);
        },
        routes: <RouteBase>[
          ...AppRoutes.mainMenuRoutes,
        ],
      ),
    ],
  );

 
}
