part of '../cores.dart';

extension IntExtension on int {
  String toAbbreviatedString() {
    return NumberFormat.compact().format(this);
  }
}
