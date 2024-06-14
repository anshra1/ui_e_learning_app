import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toStringByFormat(String newPattern) {
    return DateFormat(newPattern).format(this);
  }

  String toDDMMhmmaFormat() {
    return DateFormat('yyyy-dd-MM h:mm:s a').format(this);
  }
}
