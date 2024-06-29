import 'package:dartz/dartz.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/comtrollers/pagination_controller.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';
import 'package:maindmate/main.dart';

class StoriesController extends PaginationController<StoryModel> {
  StoriesController()
      : super(fetchDataCallback: _fetchData, cacheKey: "Stories");

  // Updated _fetchData to match the new signature
  static Future<Either<ErrorResponse, Map<String, dynamic>>> _fetchData(
      String url, int page, Map<String, dynamic> additionalParams) async {
    String token = await storeService.readString("token");
    String apiUrl = "${ServerConstApis.stories}?page=$page";

    // Returning the result of the API call
    return ApiHelper.makeRequest(
      targetRout: apiUrl,
      method: "GET",
      token: token,
    );
  }

  @override
  void handleDataSuccess(dynamic handlingResponse) {
    try {
      print(handlingResponse);
      List<dynamic> categoryListJson = handlingResponse['data'];

      // Check the type of elements in categoryListJson
      // if (categoryListJson.isNotEmpty &&
      //     categoryListJson[0] is! Map<String, dynamic>) {
      //   throw Exception('Unexpected JSON format');
      // }

      lastPageId = handlingResponse['last_page'];

      itemList.addAll(categoryListJson
          .map((jsonItem) => StoryModel.fromMap(jsonItem))
          .toList());

      print(itemList.length);

      if (pageId == lastPageId) {
        hasMoreData.value = false;
      }

      pageId++;
      isLoading.value = false;
      isLoadingMoreData.value = false;
    } catch (e) {
      print('Error parsing JSON: $e');
      // Handle the error appropriately
    }
  }
}
