import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/app_bottom_bar_item.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/modules/menus/course_view/courses_view.dart';
import 'package:ui_e_learning_app/modules/menus/home_view/home_view.dart';
import 'package:ui_e_learning_app/modules/menus/live_course_view/live_courses_view.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/profile_view.dart';

class AppNavBar extends HookWidget {
  const AppNavBar({
    required this.child,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('AppNavBar'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final indexValue = useState(0); // another Method

    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomBar(
        opacity: .2,
    //    currentIndex: _calculateSelectedIndex(context),
        onTap: (int? index) => _onTap(
          context,
          index ?? 0,
          (value) {
            indexValue.value = value;
          },
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
        elevation: 8,
        hasInk: true, //new, gives a cute ink effect
        items: _navigationItems,
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(HomeView.routeName)) {
      return 0;
    }
    if (location.startsWith(CoursesView.routeName)) {
      return 1;
    }
    if (location.startsWith(LiveCoursesView.routeName)) {
      return 2;
    }
    if (location.startsWith(ProfileView.routeName)) {
      return 3;
    }

    return 0;
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(
    BuildContext context,
    int index,
    void Function(int) onPresed,
  ) {
    switch (index) {
      case 0:
        context.go(HomeView.routeName);
        onPresed(index);
      case 1:
        context.go(CoursesView.routeName);
        onPresed(index);
      case 2:
        context.go(LiveCoursesView.routeName);
        onPresed(index);
      case 3:
        GoRouter.of(context).go(ProfileView.routeName);
        onPresed(index);
    }
  }

  static const _navigationItems = <AppBottomBarItem>[
    AppBottomBarItem(
      icon: Icon(AppIcons.home),
      activeIcon: Icon(AppIcons.homeAlt),
      title: Text('Home'),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.courses),
      activeIcon: Icon(AppIcons.coursesAlt),
      title: Text('Courses'),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.live),
      activeIcon: Icon(AppIcons.liveAlt),
      title: Text('Live'),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.profile),
      activeIcon: Icon(AppIcons.profileAlt),
      title: Text('Profile'),
    ),
  ];
}
