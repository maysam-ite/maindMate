import 'package:get/get.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';

class StoryDetailesController extends GetxController {
  late final StoryModel storyModel;
  @override
  void onInit() {
    // TODO: implement onInit
    storyModel=Get.arguments;
    super.onInit();
  }
}
