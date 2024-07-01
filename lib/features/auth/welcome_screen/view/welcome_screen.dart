import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/theme/app_theme.dart';
import 'package:maindmate/features/auth/welcome_screen/view/widgets/build_page_view.dart';
import 'package:maindmate/main.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final PageController controller =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    appTheme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: appTheme.primaryBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 50.h,
          ),
          Image.asset('assets/images/Component.png'),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'مايندمت هو تطبيق رعاية وعلاج الصحة العقلية والنفسية',
            style: appTheme.text16,
            textAlign: TextAlign.center,
          ),
          BuildPageView(
            controller: controller,
          ),
          // BuildPageIndecator(pageController: controller,),
          SizedBox(
            height: 90.h,
          ),
          ButtonWidget(
            showLoadingIndicator: false,
            onPressed: () {
              Get.toNamed('/SignInScreen');
            },
            text: ("الدخول كمستخدم"),
            options: ButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: 50,
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: appTheme.primary,
              textStyle: appTheme.text18.copyWith(color: Colors.white),
              elevation: 3,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(
            showLoadingIndicator: false,
            onPressed: () {
              Get.offAllNamed('/MainBottomNavigationBarWidget');
            },
            text: ("الدخول كزائر"),
            options: ButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: 50,
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: appTheme.secondary,
              textStyle: appTheme.text18.copyWith(color: Colors.white),
              elevation: 3,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ]),
      ),
    );
  }
}
