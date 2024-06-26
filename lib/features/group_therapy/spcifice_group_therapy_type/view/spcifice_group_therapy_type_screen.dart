import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/features/group_therapy/spcifice_group_therapy_type/controller/spcifice_group_therapy_type_controller.dart';
import 'package:maindmate/features/group_therapy/spcifice_group_therapy_type/view/widgets/spcifice_group_therapy_type_card.dart';
import 'package:maindmate/main.dart';

class SpcificeGroupTherapyTypeScreen extends StatelessWidget {
   SpcificeGroupTherapyTypeScreen({super.key});
final  SpcificeGroupTherapyTypeController spcificeGroupTherapyTypeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(title:spcificeGroupTherapyTypeController.pageTitle),
      backgroundColor: appTheme.primaryBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            ...List.generate(3, (index) => SpcificeGroupTherapyTypeCard())
          ].divide(SizedBox(height: 10.h,))
          
          ),),
    );
  }
}