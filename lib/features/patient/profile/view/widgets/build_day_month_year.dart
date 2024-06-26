import '../../../../../main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayMonthYear extends StatelessWidget {
  DayMonthYear({super.key, required this.value});
  String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: appTheme.text14
              .copyWith(color: appTheme.secondaryText, fontSize: 14),
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: appTheme.secondaryText,
          size: 20,
        ),
      ],
    );
  }
}
