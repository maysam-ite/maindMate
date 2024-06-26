import 'package:dartz/dartz.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/comtrollers/pagination_controller.dart';
import 'package:maindmate/features/stories/stories/model/story_comment_model.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';
import 'package:maindmate/main.dart';

class StoriesController extends PaginationController<StoryModel> {
  StoriesController()
      : super(fetchDataCallback: _fetchData, cacheKey: "Stories");
  
  // Updated _fetchData to match the new signature
  static Future<Either<ErrorResponse, Map<String, dynamic>>> _fetchData(
      String url, int page, Map<String, dynamic> additionalParams) async {
    String token = await storeService.readString("token");
    String apiUrl =
        "${ ServerConstApis.stories}?page=$page";

    // Returning the result of the API call
    return ApiHelper.makeRequest(
      targetRout: apiUrl,
      method: "GET",
      token: token,
    );
  }

  @override
  handleDataSuccess(dynamic handlingResponse) {
    List<dynamic> categoryListJson = handlingResponse['data'];
    lastPageId = handlingResponse['last_page'];
    itemList.addAll(categoryListJson
        .map((jsonItem) => StoryModel.fromJson(jsonItem))
        .toList());
    if (pageId == lastPageId) {
      hasMoreData.value = false;
    }
    pageId++;
    isLoading.value = false;
    isLoadingMoreData.value = false;
  }

  }

final List<StoryModel> fakeStories = [
  const StoryModel(
    id: 1,
    userId: 101,
    text: "لقد كنت أشعر بتحسن كبير منذ أن بدأت العلاج. التمارين والتقنيات التي تعلمتها ساعدتني كثيرًا في التحكم في قلقي. لقد كنت أعاني من مشاكل القلق لسنوات عديدة، ولكن بفضل الدعم الذي تلقيته من طبيبي النفسي، بدأت أرى تحسنًا واضحًا في حالتي. كنت أجد صعوبة في النوم وفي التركيز على عملي، ولكن الآن أشعر بأنني أكثر استقرارًا وهدوءًا. التحدث مع معالجي كان مفيدًا للغاية، حيث قدم لي نصائح عملية يمكنني استخدامها في حياتي اليومية. أشعر بالامتنان العميق لكل الدعم والتشجيع الذي تلقيته خلال هذه الفترة.",
    image: "https://images.unsplash.com/photo-1508780709619-79562169bc64",
    video: null,
    status: "published",
    imageUrl: "https://example.com/imageUrl1.jpg",
    storyComments: [
      StoryCommentModel(
        id: 1,
        storyId: 1,
        userId: 201,
        text: "هذا رائع! استمر في العمل الجيد!",
        status: "approved",
      ),
      StoryCommentModel(
        id: 2,
        storyId: 1,
        userId: 202,
        text: "أنا سعيد لأن العلاج يعمل معك.",
        status: "approved",
      ),
    ],
  ),
  const StoryModel(
    id: 2,
    userId: 102,
    text: "الدعم الذي تلقيته من معالجي كان مذهلاً. لقد ساعدني في الحصول على منظور جديد لحياتي. كنت أشعر بأنني فقدت السيطرة على الكثير من جوانب حياتي، ولكن بفضل الجلسات العلاجية، أصبحت أكثر وعيًا بما يحدث من حولي وأكثر قدرة على التعامل مع التحديات. كانت هناك لحظات صعبة بالطبع، ولكن المساندة التي تلقيتها جعلتني أشعر بأنني لست وحدي في هذا. أشعر بأنني شخص جديد وأكثر إيجابية بفضل التوجيه الذي تلقيته.",
    image: null,
    video: "https://example.com/video2.mp4",
    status: "published",
    imageUrl: "https://example.com/imageUrl2.jpg",
    storyComments: [
      StoryCommentModel(
        id: 3,
        storyId: 2,
        userId: 203,
        text: "قصة ملهمة. شكراً على المشاركة!",
        status: "approved",
      ),
      StoryCommentModel(
        id: 4,
        storyId: 2,
        userId: 204,
        text: "سعيد لسماع عن تقدمك.",
        status: "approved",
      ),
    ],
  ),
  const StoryModel(
    id: 3,
    userId: 103,
    text: "لقد وفر لي العلاج أدوات للتعامل مع ضغوطي. أشعر بالامتنان للتقدم الذي أحرزته حتى الآن. كانت الحياة مليئة بالتحديات، ولكن بفضل جلسات العلاج، تمكنت من تطوير استراتيجيات فعالة للتعامل مع هذه الضغوط. كل جلسة كانت تقدم لي شيئًا جديدًا أتعلمه وأطبقه في حياتي اليومية. الحديث عن مشاعري وأفكاري بحرية كان له أثر كبير على تحسين حالتي النفسية. أشعر بأنني شخص أقوى وأكثر قدرة على مواجهة الحياة بفضل الدعم الذي تلقيته.",
    image: "https://example.com/image3.jpg",
    video: "https://example.com/video3.mp4",
    status: "draft",
    imageUrl: "https://example.com/imageUrl3.jpg",
    storyComments: [
      StoryCommentModel(
        id: 5,
        storyId: 3,
        userId: 205,
        text: "رحلتك ملهمة. استمر في التقدم!",
        status: "pending",
      ),
      StoryCommentModel(
        id: 6,
        storyId: 3,
        userId: 206,
        text: "شكراً لمشاركة تجربتك.",
        status: "approved",
      ),
    ],
  ),
];
