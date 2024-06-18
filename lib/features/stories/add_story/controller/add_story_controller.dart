// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddStoryController extends GetxController{
  TextEditingController storyText=TextEditingController();
  RxBool isLoading =false.obs;
  
MediaType? media;
  final imagePicker = ImagePicker();
  void pickMediaForStory() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
media=MediaType(isVideo: false,data: File(pickedImage.path));
      update();
      Get.back();
    }
  }
   pickVideoForStory(ImageSource imageSource, bool isProfile) async {
     final ImagePicker picker = ImagePicker();
    final XFile? pickedVideo =
        await picker.pickVideo(source: ImageSource.gallery);

     media != null ? MediaType(isVideo: false,data: File(pickedVideo!.path)) : null;
  
  }
  onPressContinue(){}
}



class MediaType {
  bool isVideo;
  File? data;
  MediaType({
    required this.isVideo,
    this.data,
  });
  
}
