import 'package:easy_localization/easy_localization.dart';

String? phoneValidation(String? value) {
  // Preprocess to ensure consistency
  if (value != null && value.startsWith('9') && value.length == 9) {
    value = '0$value'; // Adjust the input for validation
  }

  if (value == null || value.isEmpty) {
    return tr("please_enter_phone_number"); // Handle null or empty input
  }

  // Validate Syrian phone numbers (now considering the preprocessing step)
  if (!RegExp(r'^09\d{8}$').hasMatch(value)) {
    return tr("please_enter_valid_syrian_phone_number");
  }

  // No error found
  return null;
  
}
