import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/widgets/dialog/app_navigation_dialog.dart';
import 'package:maindmate/main.dart';

generalAppBar( {required String title}) {
  return AppBar(
    surfaceTintColor: appTheme.primaryBackground,
    leading: Image.asset('assets/images/Component.png'),
    title:  Center(
      child: Text(title,style:appTheme.text16).tr(),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
             Get.dialog(const AppNavigationDialog());
           
        },
      ),
    ],
  );
}
