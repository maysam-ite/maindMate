import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/widgets/active_sessions_list.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/widgets/my_appointments_section.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/widgets/session_classifications_section.dart';
import 'package:maindmate/main.dart';

class SelectGroupTherapyScreen extends StatelessWidget {
  const SelectGroupTherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      backgroundColor: appTheme.primaryBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: Column(
          children: [
            ActiveSessionsList(),
            SessionClassificationSection(),
            MyAppointmentsSection()
          ].divide(SizedBox(
            height: 15,
          )),
        ),
      ),
    );
  }
}
