// ignore_for_file: lines_longer_than_80_chars

part of '../cores.dart';

extension StringExtension on String {
  String get overflow => Characters(this).replaceAll(Characters(''), Characters('\u{200B}')).toString();
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
