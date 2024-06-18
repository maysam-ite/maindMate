import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/view/main_bottom_navigation_icon.dart';
import '../controller/main_bottom_navigation_controller.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavigationBarWidget extends StatelessWidget {
  MainBottomNavigationBarWidget({super.key});
  final MainBottomNavigationController mainBottomNavigationController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (popHandled) {
        // Check if the pop event has not been handled and the current index is not the home page
        if (mainBottomNavigationController.selectedPage.value != 0) {
          // Change to the home page index
          mainBottomNavigationController.changePage(0);
        } else {
          if (true) {
            Get.offAllNamed('/');
          } else {
            SystemNavigator.pop();
          }
        }
      },
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Obx(() => Scaffold(
              extendBody: true,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: mainBottomNavigationController.getScreen(
                    mainBottomNavigationController.selectedPage.value),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50.h,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: appTheme.primaryBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconPagesButton(
                        context: context,
                        icon: Icons.person_outline,
                        activeIcon: Icons.person,
                        index: 4,
                        currentPage:
                            mainBottomNavigationController.selectedPage),
                    iconPagesButton(
                        context: context,
                        icon: Icons.groups_outlined,
                        activeIcon: Icons.groups,
                        index: 3,
                        currentPage:
                            mainBottomNavigationController.selectedPage),
                    SizedBox(
                      width: 50.w,
                    ),
                    iconPagesButton(
                        context: context,
                        icon: Icons.chat_outlined,
                        activeIcon: Icons.chat,
                        index: 1,
                        currentPage:
                            mainBottomNavigationController.selectedPage),
                    iconPagesButton(
                        context: context,
                        icon: Icons.home_outlined,
                        activeIcon: Icons.home,
                        index: 0,
                        currentPage:
                            mainBottomNavigationController.selectedPage)
                  ],
                ),
              ),
              floatingActionButton:
                  MediaQuery.of(context).viewInsets.bottom != 0
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              mainBottomNavigationController.changePage(2);
                            },
                            child: const Icon(
                              Icons.add_circle,
                              size: 60,
                              color: Colors.blue,
                            ),
                          ),
                        ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            )),
      ),
    );
  }
}
