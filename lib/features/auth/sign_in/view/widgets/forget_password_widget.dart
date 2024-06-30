import 'package:easy_localization/easy_localization.dart';

import '../../../../../main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FogetPasswordWidget extends StatelessWidget {
  const FogetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed('/ForgetPasswordScreen');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: tr("Forget Password?"),
              style: appTheme.text16.copyWith(
                // fontFamily: 'Merriweather',
                color: appTheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: tr("reset it."),
              style: appTheme.text14.copyWith(
                color: appTheme.secondaryText,
              ),
            )
          ],
          style: appTheme.text14,
        ),
      ),
    );
  }
}
