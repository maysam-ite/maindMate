import 'package:get/get.dart';
import 'package:maindmate/features/payment/add_payment_card/controller/add_payment_card_controller.dart';
// Import your controller

class AddPaymentCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentCardController>(() => AddPaymentCardController());
  }
}
