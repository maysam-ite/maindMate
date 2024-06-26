import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/widgets/dialog/app_navigation_dialog.dart';
import 'package:maindmate/features/stories/stories/controller/stories_controller.dart';
import 'package:maindmate/features/stories/stories/view/widgets/stories_loading_widget.dart';
import 'package:maindmate/features/stories/stories/view/widgets/stories_widget.dart';
import 'package:maindmate/main.dart';

class StoriesScreen extends StatelessWidget {
  StoriesScreen({super.key});
  final StoriesController storiesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryBackground,
      appBar: AppBar(
        surfaceTintColor: appTheme.primaryBackground,
        leading: Image.asset('assets/images/Component.png'),
        title: Center(
          child: const Text('others_excperience').tr(),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Get.dialog(const AppNavigationDialog());
              })
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BookConsultationButton(),
                GroupCallButton(),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => storiesController.isLoading.value
            ? buildLoadingStoriesList()
            : RefreshIndicator(
                onRefresh: () async {
                  await storiesController.refreshData();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: storiesController.itemList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.5.h),
                      child: StoriesWidget(
                        storyModel: storiesController.itemList[index],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

class GroupCallButton extends StatelessWidget {
  const GroupCallButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () {},
      text: tr('group_call'),
      options: ButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: 50,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.primary,
        textStyle: appTheme.text14.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
    );
  }
}

class BookConsultationButton extends StatelessWidget {
  const BookConsultationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () {
        Get.toNamed('/BookAConsultationScreen');
      },
      text: tr('book_consultation'),
      options: ButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: 50,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.primary,
        textStyle: appTheme.text14.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
    );
  }
}
