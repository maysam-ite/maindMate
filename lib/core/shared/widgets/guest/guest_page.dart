import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet.dart';
import 'package:maindmate/features/auth/sign_in/controller/sign_in_controller.dart';
import 'package:maindmate/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:maindmate/features/auth/sign_up/controller/sign_up_controller.dart';
import 'package:maindmate/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:maindmate/main.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      height: 75,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Unlock full access to Mind Mate features",
                    textAlign: TextAlign.center,
                    style: appTheme.text16.copyWith(
                      fontSize: 18,
                    ),
                  ).tr(),
                  SizedBox(height: 20),
                  Text(
                    "Register or log in to start your journey with us.",
                    textAlign: TextAlign.center,
                    style: appTheme.text14.copyWith(
                      fontSize: 16,
                    ),
                  ).tr(),
                ].divide(const SizedBox(height: 20)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          onPressed: () async {
                            Get.lazyPut(() => SignUpController());

                            await showButtonSheet(
                                    context: context,
                                    widget: SignUpScreen(),
                                    height: MediaQuery.of(context).size.height *
                                        0.8)
                                .then(
                                    (value) => Get.delete<SignUpController>());
                          },
                          text: tr("Join"),
                          options: ButtonOptions(
                            height: 50,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            color: appTheme.primaryBackground,
                            textStyle: appTheme.text14.copyWith(
                              color: appTheme.primaryText,
                            ),
                            elevation: 3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        ButtonWidget(
                          onPressed: () async {
                            Get.lazyPut(() => SignInController());

                            await showButtonSheet(
                                    context: context,
                                    widget: SignInScreen(),
                                    height: MediaQuery.of(context).size.height *
                                        0.8)
                                .then(
                                    (value) => Get.delete<SignInController>());
                          },
                          text: tr("Sign in"),
                          options: ButtonOptions(
                            height: 50,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            color: appTheme.secondaryBackground,
                            textStyle: appTheme.text14.copyWith(
                              color: appTheme.primaryText,
                            ),
                            elevation: 3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Join us and discover what's waiting for you in Mind Mate!",
                    textAlign: TextAlign.center,
                    style: appTheme.text14.copyWith(
                      fontFamily: 'Nunito',
                      color: appTheme.primary,
                    ),
                  ).tr(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
