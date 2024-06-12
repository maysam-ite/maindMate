import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../main.dart'; // Make sure this import is correct to access appTheme

Widget internationalField(TextEditingController controller) {
  bool isInputValid = false;
  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber number) {
    },
    textFieldController: controller,
    onInputValidated: (bool value) {
      isInputValid = value;
    },
    selectorConfig: const SelectorConfig(
      trailingSpace: false,
      selectorType: PhoneInputSelectorType.DIALOG,
    ),
    searchBoxDecoration:InputDecoration(hintText: tr('country_search')) ,
    locale: 'ar',
    validator: (String? g) {
      return isInputValid ? null : tr("invalid_phone_number");
    },
    textAlign:
        Get.locale == const Locale('ar') ? TextAlign.right : TextAlign.left,
    ignoreBlank: false,
    autoValidateMode: AutovalidateMode.disabled,
    selectorTextStyle: const TextStyle(color: Colors.black),
    initialValue: PhoneNumber(isoCode: 'US'),
    formatInput: false,
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(
          color: appTheme.primary, // Use primary color for normal state
        ),
      ),
      labelText: tr("phone"),
      hintText: tr("enter_phone"),
      labelStyle: appTheme.text16,
      hintStyle: appTheme.text16,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.error,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.error,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      filled: true,
      fillColor: appTheme.primaryBackground,
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
    ),
  );
}
