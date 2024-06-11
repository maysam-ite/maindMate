import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/features/experience/experience_of_others/view/widgets/experience_of_others_Widget.dart';
import 'package:maindmate/main.dart';

class ExperienceOfOthersScreen extends StatelessWidget {
  const ExperienceOfOthersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: appTheme.primaryBackground,
        leading: Image.asset('assets/images/Component 2 – 2.png'),
        title: const Center(
          child: Text('Centered Title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  onPressed: () {
                    Get.toNamed('/BookAConsultationScreen');
                  },
                  text: tr('book_consultation'),
                  options: ButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50,
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: appTheme.primary,
                    textStyle: appTheme.text18.copyWith(color: Colors.white),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                ButtonWidget(
                  onPressed: () {},
                  text: tr('group_call'),
                  options: ButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50,
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: appTheme.primary,
                    textStyle: appTheme.text18.copyWith(color: Colors.white),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const ExperienceOfOthersWidget(),
            ...List.generate(3, (index) => const ExperienceOfOthersWidget())
          ]
              .divide(SizedBox(
                height: 15.h,
              ))
              .addToStart(SizedBox(
                height: 15.h,
              )),
        ),
      ),
    );
  }
}
