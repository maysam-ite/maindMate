import 'package:get/get.dart';
import 'package:maindmate/features/stories/stories/controller/stories_controller.dart';

class StoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoriesController>(
        () => StoriesController());
  }
}
