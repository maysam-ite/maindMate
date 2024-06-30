import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maindmate/features/auth/verify_email/controller/verify_email_controller.dart';
import 'package:maindmate/main.dart';

class VerifyEmailScreen extends StatelessWidget {
  final VerifyEmailController verifyEmailController =
      Get.put(VerifyEmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verify Your Email",
          style: TextStyle(color: Colors.white),
        ).tr(),
        backgroundColor: appTheme.primary,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                size: 100,
                color: appTheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                "Please verify your email to continue using the app.",
                textAlign: TextAlign.center,
                style: appTheme.text16,
              ).tr(),
              const SizedBox(height: 20),
              Text(
                "Check your email for a verification link. If you haven't received it, you can request a new one.",
                textAlign: TextAlign.center,
                style: appTheme.text14,
              ).tr(),
              const SizedBox(height: 30),
              Obx(() => verifyEmailController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            verifyEmailController.resendVerificationEmail();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            backgroundColor: appTheme.primary,
                          ),
                          child: Text(
                            "Resend Verification Email",
                            style:
                                appTheme.text16.copyWith(color: Colors.white),
                          ).tr(),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            verifyEmailController.checkIfVerified();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            backgroundColor: appTheme.primary,
                          ),
                          child: Text(
                            "Continue",
                            style:
                                appTheme.text16.copyWith(color: Colors.white),
                          ).tr(),
                        ),
                      ],
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
