import 'package:get/get.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/controller/book_a_consultation_controller.dart';
// Import your controller

class BookAConsultationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAConsultationController>(
        () => BookAConsultationController());
  }
}
