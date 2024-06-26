import 'package:get/get.dart';
import 'package:maindmate/features/group_therapy/spcifice_group_therapy_type/controller/spcifice_group_therapy_type_controller.dart';
// Import your controller

class SpcificeGroupTherapyTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpcificeGroupTherapyTypeController>(() => SpcificeGroupTherapyTypeController());
   }
}
