// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maindmate/main.dart';

// ignore: must_be_immutable
class MyMinutes extends StatelessWidget {
  int mins;
  final bool isCenterItem;

  MyMinutes({required this.mins, required this.isCenterItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
         
        child: Center(
          child: Text(
            mins < 10 ? '0$mins' : mins.toString(),
            style: TextStyle(
              fontSize: 20,
              color:    isCenterItem?appTheme.primaryBtnText:appTheme.primaryText
      ,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}