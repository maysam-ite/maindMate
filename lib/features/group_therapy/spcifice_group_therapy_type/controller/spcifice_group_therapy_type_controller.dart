import 'package:get/get.dart';

class SpcificeGroupTherapyTypeController extends GetxController{
  late final  String pageTitle;
  @override
  void onInit() {
    pageTitle=Get.arguments;
    super.onInit();
  }
}