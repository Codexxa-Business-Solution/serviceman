import 'package:intl/intl.dart';

class DateConverter {
  static String dateToDateAndTime(DateTime ? dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime!);
  }

  static String convertStringTimeToDate(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String dateMonthYearTime(DateTime ? dateTime) {
    return DateFormat('d MMM,y HH:mm').format(dateTime!);
  }

  static String dateStringMonthYear(DateTime ? dateTime) {
    return DateFormat('d MMM,y').format(dateTime!);
  }

  static String countDays(DateTime ? dateTime) {
    final startDate = dateTime!;
    final endDate = DateTime.now();
    final difference = endDate.difference(startDate).inDays;
    return difference.toString();
  }

  static String stringYear(DateTime ? dateTime) {
    return DateFormat('y').format(dateTime!);
  }

  static DateTime isoUtcStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }
}
