import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showGeneralAppDialog({
  required String title,
  required String message,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isCancelable = true,
}) {
  Get.dialog(
    AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onCancel ?? () => Get.back(),
          child: Text(cancelText).tr(),
        ),
        TextButton(
          onPressed: onConfirm ?? () => Get.back(),
          child: Text(confirmText).tr(),
        ),
      ],
    ),
    barrierDismissible: isCancelable,
  );
}
