import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/main.dart';

class addNewSpecialtie extends StatelessWidget {
  addNewSpecialtie({super.key});
  final DoctorProfileController doctorProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: 300,
        // height: 250,
        decoration: BoxDecoration(
          color: appTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text("add_new_specialties", style: appTheme.text12)
                        .tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: TextFormField(
                      controller: doctorProfileController.newSpecialtieName,
                      // focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: appTheme.text12,
                        hintText: tr("Specialtie_Name"),
                        hintStyle: appTheme.text12,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appTheme.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: appTheme.text12,
                      validator: (value) {
                        if (value!.length < 2) {
                          return tr("The folder name should at least 2 char");
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        onPressed: () async {
                          Get.back();
                        },
                        text: tr("Cancel"),
                        options: ButtonOptions(
                          width: 100,
                          height: 45,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: appTheme.secondaryBackground,
                          textStyle: appTheme.text12.copyWith(
                            color: appTheme.primaryText,
                            fontSize: 14,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: appTheme.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        showLoadingIndicator: false,
                      ),
                      ButtonWidget(
                        onPressed: () async {
                          doctorProfileController.addNewSpecialtie();
                          Get.back();
                        },
                        text: tr("Create"),
                        options: ButtonOptions(
                          width: 100,
                          height: 45,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: appTheme.primary,
                          textStyle: appTheme.text12,
                          elevation: 0,
                          borderSide: BorderSide(
                            color: appTheme.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
