import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/controller/main_bottom_navigation_controller.dart';
import 'package:maindmate/main.dart';

Widget iconPagesButton({
  required BuildContext context,
  required IconData icon,
  required IconData activeIcon,
  required int index,
  required RxInt currentPage,
}) {
  return GestureDetector(
      onTap: () {
        final MainBottomNavigationController mainBottomNavigationController =
            Get.find();
        mainBottomNavigationController.changePage(index);
      },
      child: Container(
        color: Colors.transparent, // Set the color to transparent

        height: 60,
        width: MediaQuery.of(context).size.width * .12,
        child: index == 2
            ? const SizedBox()
            : Obx(
                () => Icon(
                  index == currentPage.value ? activeIcon : icon,
                  color: index == currentPage.value
                      ? appTheme.primary
                      : appTheme.secondaryText,
                  size: index == currentPage.value ? 28 : 24,
                ),
              ),
      ));
}
