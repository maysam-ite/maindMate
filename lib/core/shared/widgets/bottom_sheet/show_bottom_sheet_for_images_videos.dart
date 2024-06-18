import '../../../../main.dart';
import 'package:flutter/material.dart';

Future<void> showBottomSheetForImagesAndVideos(
    {required BuildContext context,
    required Function()? onPressGallery,
    required Function()? onPressCamera,
    required Function()? onPressVideo}) async {
  return await showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      color: appTheme.secondaryBackground,
      height: 250,
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
          choosePhotoSource(
            context: context,
            title: "Video",
            onPress: onPressVideo,
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
          style: appTheme.text16.copyWith(
              fontWeight: FontWeight.w400,
              color: textColor ?? appTheme.primaryText),
        ),
      ),
    ),
  );
}
