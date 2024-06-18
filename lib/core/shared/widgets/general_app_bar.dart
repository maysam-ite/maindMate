import 'package:flutter/material.dart';
import 'package:maindmate/main.dart';

generalAppBar() {
  return AppBar(
    surfaceTintColor: appTheme.primaryBackground,
    leading: Image.asset('assets/images/Component.png'),
    title: const Center(
      child: Text('Centered Title'),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
  );
}
