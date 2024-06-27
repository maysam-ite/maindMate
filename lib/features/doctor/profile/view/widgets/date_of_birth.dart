import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/main.dart';

// ignore: must_be_immutable
class SetDateOfBirth extends StatelessWidget {
  SetDateOfBirth({super.key});
  DoctorProfileController doctorProfileController = Get.find();
  DateTime selectedDate = DateTime(2000, 1, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: appTheme.secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle: TextStyle(
                                  color: appTheme.secondaryText, fontSize: 20),
                              pickerTextStyle:
                                  TextStyle(color: appTheme.secondaryText),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            initialDateTime:
                                doctorProfileController.doctorBirthDay ??
                                    DateTime(2000, 1, 1),
                            mode: CupertinoDatePickerMode.date,
                            minimumDate: DateTime(
                                1950), // Assuming you want to allow dates back to 1800
                            maximumDate: DateTime(
                                DateTime.now().year - 12,
                                DateTime.now().month,
                                DateTime.now()
                                    .day), // 12 years and 3 days ago to account for leap years

                            onDateTimeChanged: (val) {
                              selectedDate = val;
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonWidget(
                            // showLoadingIndicator: false,
                            onPressed: () {
                              Get.back();
                            },
                            text: tr("Cancel"),
                            options: ButtonOptions(
                              width: 120,
                              height: 45,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 20, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: appTheme.secondaryBackground,
                              textStyle: appTheme.text18.copyWith(
                                  color: appTheme.primaryText,
                                  fontWeight: FontWeight.w500),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: appTheme.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          ButtonWidget(
                            onPressed: () {
                              doctorProfileController.doctorBirthDay =
                                  selectedDate;
                              doctorProfileController.update();
                              Get.back();
                            },
                            text: tr("Done"),
                            options: ButtonOptions(
                              width: 120,
                              height: 45,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 20, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: appTheme.primary,
                              textStyle: appTheme.text18.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: appTheme.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ));
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
            doctorProfileController.doctorBirthDay == null
                ? ''
                : DateFormat('yyyy-MM-dd',
                        Get.locale == const Locale('en') ? "en" : 'ar')
                    .format(doctorProfileController.doctorBirthDay!),
            style: appTheme.text16,
          );
        }),
      ),
    );
  }
}
