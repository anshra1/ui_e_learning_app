import 'package:flutter/material.dart';

class AppBottomBarItem {
  const AppBottomBarItem({
    required this.icon,
    required this.activeIcon,
    this.title,
    this.showBadge = false,
    this.badgeColor = Colors.black,
    this.badge,
    this.backgroundColor,
    this.iconColor,
  });

  final Icon icon;
  final Widget? activeIcon;
  final Widget? title;
  final bool showBadge;
  final Color badgeColor;
  final Widget? badge; // The content of badge. Usually Text or Icon.
  final Color? backgroundColor;
  final Color? iconColor;
}
