import 'package:currency_converter/utils/app.localization.dart';
import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toDate(context) {
    return DateFormat('d MMMM y', AppLocalizations.of(context).currentLanguage.toString()).format(this);
  }
}

extension IntDateExtensions on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }

  String toDate(context) {
    return DateFormat('d MMMM y').format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toStringDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String toSmallDate(context) {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}
