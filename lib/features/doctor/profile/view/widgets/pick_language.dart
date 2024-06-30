import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/const/languages_code.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/features/patient/profile/view/widgets/test_language_picker.dart';
import 'package:maindmate/main.dart';

class PickLanguage extends StatefulWidget {
  PickLanguage({super.key});

  @override
  State<PickLanguage> createState() => _PickLanguageState();
}

class _PickLanguageState extends State<PickLanguage> {
  final DoctorProfileController doctorProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openLanguagePickerDialog();
      },
      child: Container(
        width: double.infinity,
        height: (50.h),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: appTheme.primary.withOpacity(0.3),
          ),
        ),
        alignment: const AlignmentDirectional(-1, 0.00),
        child: GetBuilder<DoctorProfileController>(builder: (context) {
          return Text(
            doctorProfileController.language ?? "",
            style: appTheme.text16,
          );
        }),
      ),
    );
  }

// It's sample code of Dialog Item.
  Widget _buildDialogItem(AppLanguage language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(),
            child: CustomLanguagePickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchInputDecoration:
                    const InputDecoration(hintText: ('البحث...')),
                isSearchable: true,
                title: const Text('Select your language').tr(),
                onValuePicked: (AppLanguage language) => setState(() {
                      doctorProfileController.language = language.name;
                    }),
                itemBuilder: _buildDialogItem)),
      );
}
