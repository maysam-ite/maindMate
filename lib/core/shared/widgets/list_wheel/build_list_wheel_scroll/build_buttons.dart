import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/main.dart';

Padding buildButtons(
    {required BuildContext context, Function()? onPressedSubmit}) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWidget(
          showLoadingIndicator: false,
          onPressed: () async {
            Navigator.pop(context);
          },
          text: tr('Cancel'),
          options: ButtonOptions(
            height: 30,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: appTheme.secondaryBackground,
            textStyle: appTheme.text14.copyWith(
              fontFamily: 'Readex Pro',
              color: appTheme.primary,
            ),
            elevation: 3,
            borderSide: BorderSide(
              color: appTheme.primaryBackground,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        ButtonWidget(
          showLoadingIndicator: false,
          onPressed: onPressedSubmit,
          text: tr('Done'),
          options: ButtonOptions(
            height: 30,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: appTheme.primary,
            textStyle: appTheme.text14.copyWith(
              color: Colors.white,
            ),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    ),
  );
}
