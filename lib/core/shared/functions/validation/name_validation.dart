import 'package:easy_localization/easy_localization.dart';

String? nameValidation(String? value) {
  if (value == null || value.isEmpty) {
    return tr("please_enter_a_name"); // Handle null or empty input
  }
  if (value.length <= 2) {
    return tr("please_type_longer_name");
  } else if (value.length > 20) {
    return tr("please_type_shorter_name");
  }

  return null;
}
