import 'package:easy_localization/easy_localization.dart';

String? emailValidation(String? value) {
  // Check if the value is null or empty
  if (value == null || value.isEmpty) {
    return tr("please_enter_email"); // Handle null or empty input
  }

  // Regular expression to validate email addresses
  String emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';

  if (!RegExp(emailPattern).hasMatch(value)) {
    return tr("please_enter_valid_email");
  }

  // No error found
  return null;
}
