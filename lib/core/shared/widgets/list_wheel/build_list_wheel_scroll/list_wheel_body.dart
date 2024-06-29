import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/list_wheel/build_list_wheel_scroll/am_pm.dart';
import 'package:maindmate/core/shared/widgets/list_wheel/build_list_wheel_scroll/build_buttons.dart';
import 'package:maindmate/core/shared/widgets/list_wheel/build_list_wheel_scroll/hours.dart';
import 'package:maindmate/core/shared/widgets/list_wheel/build_list_wheel_scroll/minutes.dart';
import 'package:maindmate/main.dart';

class ListWheelBody extends StatefulWidget {
  const ListWheelBody({super.key, required this.isStartTime});

  final bool isStartTime;
  @override
  State<ListWheelBody> createState() => _ListWheelBodyState();
}

class _ListWheelBodyState extends State<ListWheelBody> {
  late FixedExtentScrollController _hoursController;
  late FixedExtentScrollController _minutesController;
  late FixedExtentScrollController _ampmController;

  @override
  void initState() {
    super.initState();
    int initHour = DateTime.now().hour;
    int initMinutes = DateTime.now().minute;
    int initAmPm = 0;
    if (initHour >= 12) {
      initAmPm = 1;
    }
    if (initHour > 12) {
      initHour -= 12;
    }
    _hoursController = FixedExtentScrollController(initialItem: initHour);
    _minutesController = FixedExtentScrollController(initialItem: initMinutes);
    _ampmController = FixedExtentScrollController(initialItem: initAmPm);
  }

  @override
  void dispose() {
    // Dispose of all controllers
    _hoursController.dispose();
    _minutesController.dispose();
    _ampmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 50; // This is your itemExtent

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height: (200.h),
              child: buildbodywheels(itemHeight, context)),
          buildButtons(
            context: context,
            onPressedSubmit: () {
              // final DateTimeController dateTimeController = Get.find();
              // int selectedHour =
              //     _hoursController.selectedItem + 1; // Hours are 1-12
              // int selectedMinute =
              //     _minutesController.selectedItem; // Minutes are 0-59
              // bool isAm = _ampmController.selectedItem == 0;

              // DateTime now = DateTime.now();
              // // First, correct the hour based on the AM/PM selection BEFORE creating the DateTime
              // // Adjust the hour based on AM/PM BEFORE constructing the DateTime object
              // if (!isAm) {
              //   // It's PM
              //   if (selectedHour < 12) {
              //     // If it's not 12 PM (which is already in 24-hour format as 12), convert to 24-hour by adding 12
              //     selectedHour += 12;
              //   }
              // } else {
              //   // It's AM
              //   if (selectedHour == 12) {
              //     // If it's 12 AM, convert to 0 to comply with 24-hour format
              //     selectedHour = 0;
              //   }
              //   // No adjustment needed for 1-11 AM as they directly map to 1-11 in 24-hour time
              // }
              // DateTime selectedDateTime = DateTime(
              //     now.year, now.month, now.day, selectedHour, selectedMinute);

              // if (widget.isStartTime) {
              //   dateTimeController.startTime = selectedDateTime;
              // } else {
              //   dateTimeController.endTime = selectedDateTime;
              // }
              // dateTimeController.update();
              // Get.back();
            },
          )
        ],
      ),
    );
  }

  Stack buildbodywheels(double itemHeight, BuildContext context) {
    return Stack(
      children: [
        Align(
          // top: centralItemTopOffset,
          alignment: Alignment.center,

          child: Container(
            height: (itemHeight.h),
            margin: EdgeInsets.all(20),
            // width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular((20.r))),
              color: appTheme.secondaryText,
            ),
          ),
        ),

        buildWheelsHoursMinuetsAmPm(),
        // Positioned overlay with a transparent window
      ],
    );
  }

  Row buildWheelsHoursMinuetsAmPm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // hours wheel
        SizedBox(
          width: (70.w),
          child: ListWheelScrollView.useDelegate(
            controller: _hoursController,
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.2,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() {});
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 12,
              builder: (context, index) {
                final bool isCenterItem =
                    index == _hoursController.selectedItem;
                return MyHours(
                  isCenterItem: isCenterItem,
                  hours: index + 1,
                );
              },
            ),
          ),
        ),

        // minutes wheel
        SizedBox(
          width: (70.w),
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.2,
            controller: _minutesController,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() {});
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 60,
              builder: (context, index) {
                final bool isCenterItem =
                    index == _minutesController.selectedItem;

                return MyMinutes(
                  isCenterItem: isCenterItem,
                  mins: index,
                );
              },
            ),
          ),
        ),

        // am or pm
        SizedBox(
          width: (70.w),
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.2,
            physics: const FixedExtentScrollPhysics(),
            controller: _ampmController,
            onSelectedItemChanged: (index) {
              setState(() {});
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 2,
              builder: (context, index) {
                final bool isCenterItem = index == _ampmController.selectedItem;

                if (index == 0) {
                  return AmPm(
                    isCenterItem: isCenterItem,
                    isItAm: true,
                  );
                } else {
                  return AmPm(
                    isCenterItem: isCenterItem,
                    isItAm: false,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
