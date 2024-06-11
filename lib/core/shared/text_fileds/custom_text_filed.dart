import '../../../../main.dart';
import 'package:flutter/material.dart';

Widget customTextField(
    {Widget? prefix,
    required String label,
    bool? isPassWordVisible,
    Widget? suffixIcon,
    String? errorText,
    required String? Function(String?) validator,
    required TextEditingController controller,
    TextInputType? keyboardType
    }) {
  return TextFormField(
    
    keyboardType: keyboardType,
    controller:controller,
    obscureText: isPassWordVisible??false,
    decoration: InputDecoration(
      hoverColor: appTheme.secondaryBackground,
      suffixIcon:suffixIcon,
      prefix: prefix,
floatingLabelBehavior: FloatingLabelBehavior.never,
      errorText: errorText,
      labelText: label,
      labelStyle: appTheme.text16,
      hintStyle: appTheme.text16,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: appTheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: appTheme.error,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: appTheme.error,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      filled: true,
      fillColor: appTheme.primaryBackground,
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
    ),
    style: appTheme.text16,
    validator: validator,
  );
}

