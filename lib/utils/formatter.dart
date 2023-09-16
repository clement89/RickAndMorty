import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(String dateString) {
    final outputFormat = DateFormat.yMMMd();

    try {
      final parsedDate = DateTime.parse(dateString);
      return outputFormat.format(parsedDate);
    } catch (e) {
      // Handle date parsing error, return the original string if needed
      return dateString;
    }
  }
}
