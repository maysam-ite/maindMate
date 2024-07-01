import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/main.dart';

class ErrorInGuest extends StatelessWidget {
  const ErrorInGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.secondaryBackground,
      body: SizedBox(
        child: Center(
          child: GestureDetector(
              onTap: () {
                Get.offAllNamed('/');
              },
              child: Text("You are guest")),
        ),
      ),
    );
  }
}
