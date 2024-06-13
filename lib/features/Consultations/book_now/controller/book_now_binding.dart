import 'package:get/get.dart';
import 'package:maindmate/features/Consultations/book_now/controller/book_now_controller.dart';
// Import your controller

class BookNowBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookNowController>(() => BookNowController());
  }
}
