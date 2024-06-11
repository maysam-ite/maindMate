import 'package:easy_localization/easy_localization.dart';

String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return tr("password_is_required"); // Password is required
  }
  if (value.length < 8) {
    return tr(
        "password_must_be_at_least_8_characters_long"); // Check for minimum length
  }
  // Check for at least one letter
  if (!RegExp(r'(?=.*[A-Za-z])').hasMatch(value)) {
    return tr(
        "password_must_contain_at_least_one_letter"); // Check for at least one letter
  }
  // Check for at least one number
  if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
    return tr(
        "password_must_contain_at_least_one_number"); // Check for at least one number
  }
  return null; // If all conditions are met, return null (valid)
}
