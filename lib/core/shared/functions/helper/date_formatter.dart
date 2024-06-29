import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  // Formats a DateTime object into a date string.
  static String formatDate(DateTime dateTime) {
    // You can customize the date format string as needed
    DateFormat dateFormat = DateFormat('yyyy-MM-dd', Get.locale.toString());
    // DateFormat dateFormat = DateFormat('EEE dd MMM ', Get.locale.toString());
    // DateFormat dateFormat = DateFormat.();
    return dateFormat.format(dateTime);
  }

  // Formats a DateTime object into a time string.
  static String formatTime(DateTime dateTime) {
    // You can customize the time format string as needed
    DateFormat timeFormat = DateFormat('h:mm a', Get.locale.toString());
    return timeFormat.format(dateTime);
  }

  static String getYear(DateTime dateTime) {
    // Define the date format to extract only the year
    DateFormat yearFormat = DateFormat('yyyy', Get.locale.toString());
    return yearFormat.format(dateTime);
  }
}

int calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }
  return age;
}
