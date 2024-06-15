import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/main.dart';

class AddPaymentCardScreen extends StatelessWidget {
  const AddPaymentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.secondaryBackground,
      appBar: generalAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/payment card.png'),
            _buildTextFieldSection(
              label: 'الاسم',
              hint: 'ادخل الاسم',
              controller: TextEditingController(),
              icon: Icons.person_outline_rounded,
            ),
            _buildTextFieldSection(
              label: 'رقم البطاقة',
              hint: '1654856899',
              controller: TextEditingController(),
              icon: Icons.person_outline_rounded,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildTextFieldSection(
                    label: 'تاريخ الانتهاء',
                    hint: '13/6',
                    controller: TextEditingController(),
                    icon: Icons.person_outline_rounded,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 2,
                  child: _buildTextFieldSection(
                    label: 'CSV/CVV',
                    hint: '356',
                    controller: TextEditingController(),
                    icon: Icons.person_outline_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              // showLoadingIndicator: signInController.isLoading.value,
              onPressed: () {
                Get.toNamed('/ConfirmPaymentScreen');
              },
              text: ('اضافة بطاقة'),
              options: ButtonOptions(
                width: 0.6.sw,
                height: 50.h,
                padding: EdgeInsetsDirectional.fromSTEB(24.w, 0, 24.w, 0),
                iconPadding: EdgeInsetsDirectional.zero,
                color: appTheme.primary,
                textStyle: appTheme.text18.copyWith(color: Colors.white),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
          ].divide(const SizedBox(
            height: 10,
          )),
        ),
      ),
    );
  }

  Widget _buildTextFieldSection({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 10,
        ),
        customTextField(
          label: hint,
          controller: controller,
          prefix: Icon(icon),
          height: 40,
          validator: (val) {
            return null;
            // Add your validation logic here
          },
        ),
      ],
    );
  }
}
