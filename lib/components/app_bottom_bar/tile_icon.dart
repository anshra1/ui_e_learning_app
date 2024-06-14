import 'package:badges/badges.dart' as b;

import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/app_bottom_bar_item.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class TileIcon extends StatelessWidget {
  const TileIcon({
    required this.colorTween,
    required this.animation,
    required this.iconSize,
    required this.selected,
    required this.item,
    super.key,
  });

  final ColorTween colorTween;
  final Animation<double> animation;
  final double iconSize;
  final bool selected;
  final AppBottomBarItem item;

  @override
  Widget build(BuildContext context) {
    final iconColor = item.iconColor ?? Colors.black54;
    final backgroundColor =
        item.backgroundColor ?? context.theme.colorScheme.primary;

    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1,
      child: b.Badge(
        showBadge: item.showBadge,
        badgeContent: item.badge,
        //   badgeColor: item.badgeColor,
        //   animationType: b.BadgeAnimationType.fade,
        child: IconTheme(
          data: IconThemeData(
            color: selected ? backgroundColor : iconColor,
            size: iconSize,
          ),
          child: selected ? item.activeIcon! : item.icon,
        ),
      ),
    );
  }
}
