import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/controller/main_bottom_navigation_controller.dart';
import 'package:maindmate/main.dart';

class AppNavigationDialog extends StatelessWidget {
  const AppNavigationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(1, -1),
      child: Container(
      margin: EdgeInsets.only(right: 60.w,left: 15.w),
      
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: const Alignment(-1,0),
                  child: GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: Icon(Icons.close,size: 20.w,color: appTheme.primaryText,))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(children: [
                      Center(
                    child: Image.asset('assets/images/logo.png',
                        width: 150.w, height: 40.h)),
                        SizedBox(height: 34.h,),
                        Divider(color: appTheme.lineColor,),
                            AppNavigationDialogItem(icon: Icons.home_outlined,title: 'home',onTap: (){
                              Get.find<MainBottomNavigationController>().changePage(0);
                              Get.back();
                            },),
                        Divider(color: appTheme.lineColor,),
                            AppNavigationDialogItem(icon: Icons.person_outline,title: 'show_profile',onTap: (){
                              Get.find<MainBottomNavigationController>().changePage(4);
                              Get.back();
                            },),
                        Divider(color: appTheme.lineColor,),
                            AppNavigationDialogItem(icon: Icons.message_outlined,title: 'my_Consultations',onTap: (){},),
                        Divider(color: appTheme.lineColor,),
                        SizedBox(height: 20.h,),
                        Divider(color: appTheme.lineColor,),
                            AppNavigationDialogItem(icon: Icons.logout_outlined,title: 'log_out',onTap: (){},),
                        SizedBox(height: 40.h,),

                                  
                    ].divide(SizedBox(height: 5.h,))
                    
                    ,),
                  )
                 ],
            ),
          )),
      ));
  }
}

class AppNavigationDialogItem extends StatelessWidget {
  const AppNavigationDialogItem({super.key, required this.title, required this.icon, required this.onTap});
final String title;
final IconData icon;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:  Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: appTheme.text14,).tr(),
        Icon(icon,size: 25.w,color: appTheme.primary,),
      
      ],
      ),
    );
  }
}