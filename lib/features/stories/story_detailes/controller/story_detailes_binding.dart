import 'package:get/get.dart';
import 'package:maindmate/features/stories/story_detailes/controller/story_detailes_controller.dart';
// Import your controller

class ExperienceDetailesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryDetailesController>(
        () => StoryDetailesController());
  }
}
