import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/app_bottom_bar_item.dart';

class Label extends StatelessWidget {
  const Label({
    required this.animation,
    required this.item,
    required this.color,
    super.key,
  });

  final Animation<double> animation;
  final AppBottomBarItem item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1,
      child: FadeTransition(
        alwaysIncludeSemantics: true,
        opacity: animation,
        child: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: kActiveFontSize,
            fontWeight: FontWeight.w600,
            color: color,
          ),
          child: item.title!,
        ),
      ),
    );
  }
}

const double kActiveFontSize = 14;
