import 'package:get/get.dart';
import 'package:maindmate/features/payment/add_payment_card/controller/add_payment_card_controller.dart';
import 'package:maindmate/features/payment/confirm_payment/controller/confirm_payment_controller.dart';
// Import your controller

class ConfirmPaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmPaymentController>(() => ConfirmPaymentController());
  }
}
