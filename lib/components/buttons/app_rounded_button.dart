import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    required this.label,
    super.key,
    this.onPressed,
    this.labelStyle,
    this.icon,
    this.color,
    this.labelColor,
    this.padding,
    this.height,
    this.width,
    this.useBorder = false,
    this.expanded = true,
  });

  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final Widget? icon;
  final Color? color;
  final Color? labelColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final bool useBorder;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    final colorButton = onPressed == null
        ? context.theme.shadowColor.withOpacity(.5)
        : (color ??
            (useBorder
                ? context.theme.appBarTheme.backgroundColor
                : context.theme.cardColor));
    return Padding(
      padding: !expanded
          ? EdgeInsets.zero
          : (padding ?? const EdgeInsets.symmetric(horizontal: 8)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: borderRadius,
            border: Border.all(color: Colors.grey),
          ),
          height: height,
          width: width ?? context.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: icon,
                ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: labelColor ?? Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
