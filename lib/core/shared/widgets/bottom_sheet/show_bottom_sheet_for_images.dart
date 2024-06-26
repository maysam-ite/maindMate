import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import 'package:flutter/material.dart';

Future<void> showBottomSheetForImages(
    {required BuildContext context,
    required Function()? onPressGallery,
    required Function()? onPressCamera}) async {
  return await showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      color: appTheme.secondaryBackground,
      height: 250.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          choosePhotoSource(
            context: context,
            title: "Choose Sourse",
            textColor: appTheme.secondaryText,
          ),
          choosePhotoSource(
              context: context, title: "Gallery", onPress: onPressGallery),
          choosePhotoSource(
            context: context,
            title: "Camera",
            onPress: onPressCamera,
          ),
        ],
      ),
    ),
  );
}

Widget choosePhotoSource(
    {required BuildContext context,
    required String title,
    Color? textColor,
    Function()? onPress}) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: appTheme.secondaryBackground,
      border: Border(
        bottom: BorderSide(
          color: appTheme.alternate,
          width: 2,
        ),
      ),
    ),
    child: Center(
      child: GestureDetector(
        onTap: onPress,
        child: Text(
          title,
          style: appTheme.text18.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: textColor ?? appTheme.primaryText),
        ).tr(),
      ),
    ),
  );
}
