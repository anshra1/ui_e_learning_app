import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/app_bottom_bar_item.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/label.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/tile_icon.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class BottomNavigationTile extends StatelessWidget {
  const BottomNavigationTile(
    this.item,
    this.opacity,
    this.animation,
    this.iconSize, {
    super.key,
    this.onTap,
    this.colorTween,
    this.flex,
    this.selected = false,
    this.indexLabel,
    this.ink = false,
    this.inkColor,
    this.padding,
  });

  final AppBottomBarItem item;
  final Animation<double> animation;
  final double iconSize;
  final VoidCallback? onTap;
  final ColorTween? colorTween;
  final double? flex;
  final bool selected;
  final String? indexLabel;
  final double opacity;
  final bool ink;
  final Color? inkColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        item.backgroundColor ?? context.theme.colorScheme.primary;

    int size;
    Widget label;

    size = (flex! * 1000.0).round();
    label = Label(
      animation: animation,
      item: item,
      color: backgroundColor,
    );

    return Expanded(
      flex: size,
      child: Semantics(
        container: true,
        header: true,
        selected: selected,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: padding!,
              child: InkResponse(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(50),
                  left: Radius.circular(50),
                ),
                containedInkWell: true,
                onTap: onTap,
                splashColor: ink
                    ? inkColor ?? Theme.of(context).splashColor
                    : Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: selected
                        ? backgroundColor.withOpacity(opacity)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(50),
                      left: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: selected
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      TileIcon(
                        colorTween: colorTween ?? ColorTween(),
                        animation: animation,
                        iconSize: iconSize,
                        selected: selected,
                        item: item,
                      ),
                      AnimatedCrossFade(
                        alignment: Alignment.center,
                        firstChild: label,
                        secondChild: Container(),
                        duration: const Duration(milliseconds: 200),
                        sizeCurve: Curves.fastOutSlowIn,
                        firstCurve: Curves.fastOutSlowIn,
                        secondCurve: Curves.fastOutSlowIn.flipped,
                        crossFadeState: selected
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Semantics(
              label: indexLabel,
            ),
          ],
        ),
      ),
    );
  }
}
