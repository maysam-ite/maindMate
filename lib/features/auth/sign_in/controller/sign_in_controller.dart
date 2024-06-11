import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
RxBool isRemmberMeActive=false.obs;
  RxBool isLoading=false.obs;
  late GlobalKey<FormState> formstate= GlobalKey<FormState>();
  
  final TextEditingController emailOrPhoneController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  onPressContinue(){
        FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
    }
  }
  
}