import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/functions/helper/date_formatter.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/main.dart';

class AddNewExperience extends StatefulWidget {
  AddNewExperience({
    Key? key,
    required this.experienceType,
    required this.onCreate,
  }) : super(key: key);

  final String experienceType;
  final Function(String title, String experienceFrom, DateTime startDate,
      DateTime endDate) onCreate;

  @override
  State<AddNewExperience> createState() => _AddNewExperienceState();
}

class _AddNewExperienceState extends State<AddNewExperience> {
  final TextEditingController experienceTitle = TextEditingController();
  final TextEditingController experienceFrom = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  String? dateError;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: appTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text("add_new_experience", style: appTheme.text12)
                          .tr(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: customTextField(
                      label: 'experience_title',
                      validator: (value) {
                        return value!.length < 2
                            ? tr("type_longer_text")
                            : null;
                      },
                      controller: experienceTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: customTextField(
                      label: 'experience_from',
                      validator: (value) {
                        return value!.length < 2
                            ? tr("type_longer_text")
                            : null;
                      },
                      controller: experienceFrom,
                    ),
                  ),
                  const SizedBox(height: 20),
                  pickTime(context),
                  if (dateError != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            tr(dateError!),
                            style: TextStyle(color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CancelButton(),
                        CreateButton(
                          onCreate: () {
                            FormState? formdata = formstate.currentState;
                            if (formdata!.validate()) {
                              formdata.save();
                              String? validationMessage =
                                  handlingStartEndDate(startDate, endDate);
                              setState(() {
                                dateError = validationMessage;
                              });
                              if (validationMessage == null) {
                                widget.onCreate(
                                  experienceTitle.text,
                                  experienceFrom.text,
                                  startDate!,
                                  endDate!,
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pickTime(BuildContext context) {
    void _showDatePicker(BuildContext context, DateTime? initialDate,
        Function(DateTime) onDateSelected) {
      DateTime? selectedDate;
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 300.h,
          decoration: BoxDecoration(
            color: appTheme.secondaryBackground,
            borderRadius: const BorderRadius.only(
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
                      pickerTextStyle: TextStyle(color: appTheme.secondaryText),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    initialDateTime: initialDate ?? DateTime(2000, 1, 1),
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime(1950),
                    maximumDate: DateTime(DateTime.now().year - 12,
                        DateTime.now().month, DateTime.now().day),
                    onDateTimeChanged: (date) {
                      selectedDate = date;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                    onPressed: () {
                      Get.back();
                    },
                    text: tr("Cancel"),
                    options: ButtonOptions(
                      width: 120,
                      height: 45,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: appTheme.secondaryBackground,
                      textStyle: appTheme.text18.copyWith(
                          color: appTheme.primaryText,
                          fontWeight: FontWeight.w500),
                      elevation: 0,
                      borderSide: BorderSide(color: appTheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  ButtonWidget(
                    onPressed: () {
                      if (selectedDate != null) {
                        setState(() {
                          onDateSelected(selectedDate!);
                        });
                      }
                      Get.back();
                    },
                    text: tr("Done"),
                    options: ButtonOptions(
                      width: 120,
                      height: 45,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: appTheme.primary,
                      textStyle: appTheme.text18.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      elevation: 0,
                      borderSide: BorderSide(color: appTheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  _showDatePicker(context, startDate, (val) {
                    setState(() {
                      startDate = val;
                      dateError =
                          null; // Clear error message when date is picked
                    });
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: appTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: appTheme.primary.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "from",
                        style:
                            appTheme.text14.copyWith(color: appTheme.primary),
                      ).tr(),
                      SizedBox(width: 10.w),
                      Text(
                        startDate != null
                            ? DateFormatter.formatDate(startDate!)
                            : '',
                        style: appTheme.text14
                            .copyWith(color: appTheme.secondaryText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w), // Space between the input fields
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  _showDatePicker(context, endDate, (val) {
                    setState(() {
                      endDate = val;
                      dateError =
                          null; // Clear error message when date is picked
                    });
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: appTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: appTheme.primary.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "To",
                        style:
                            appTheme.text14.copyWith(color: appTheme.primary),
                      ).tr(),
                      SizedBox(width: 10.w),
                      Text(
                        endDate != null
                            ? DateFormatter.formatDate(endDate!)
                            : '',
                        style: appTheme.text14
                            .copyWith(color: appTheme.secondaryText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
    required this.onCreate,
  });
  final Function() onCreate;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () {
        onCreate();
      },
      text: tr("Create"),
      options: ButtonOptions(
        width: 100,
        height: 45,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () async {
        Get.back();
      },
      text: tr("Cancel"),
      options: ButtonOptions(
        width: 100,
        height: 45,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
    );
  }
}

String? handlingStartEndDate(DateTime? startDate, DateTime? endDate) {
  if (startDate == null) {
    return "start_date_required";
  } else if (endDate == null) {
    return "end_date_required";
  } else if (startDate.isAfter(endDate)) {
    return 'start_date_after_end_date ';
  } else {
    return null;
  }
}
