import 'package:flutter/material.dart';

class BuildPageView extends StatelessWidget {
  const BuildPageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.3,
      child: PageView(
        controller: controller,
        children: [
        Image.asset('assets/images/Rectangle 190.png'),
        Image.asset('assets/images/Rectangle 190.png'),
        Image.asset('assets/images/Rectangle 190.png'),
        ],
      ),
    );
  }
}

