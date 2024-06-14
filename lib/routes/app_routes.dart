import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_e_learning_app/modules/menus/course_view/courses_view.dart';
import 'package:ui_e_learning_app/modules/menus/home_view/home_view.dart';
import 'package:ui_e_learning_app/modules/menus/live_course_view/live_courses_view.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/profile_view.dart';

class AppRoutes {
  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
      name: HomeView.routeName,
      path: HomeView.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child:  const HomeView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: CoursesView.routeName,
      path: CoursesView.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const CoursesView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    
    GoRoute(
      name: LiveCoursesView.routeName,
      path: LiveCoursesView.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const LiveCoursesView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: ProfileView.routeName,
      path: ProfileView.routeName,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const ProfileView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ].toList(growable: false);
}
