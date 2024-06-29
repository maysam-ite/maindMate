// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maindmate/main.dart';

// ignore: must_be_immutable
class MyHours extends StatelessWidget {
  int hours;
  bool isCenterItem;

  MyHours({super.key, required this.hours,required this.isCenterItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            hours.toString(),
            style: TextStyle(
              fontSize: 20,
              color:   isCenterItem?appTheme.primaryBtnText:appTheme.primaryText
      ,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}