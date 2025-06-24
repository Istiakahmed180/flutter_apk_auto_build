import 'package:get/get.dart';

class RecipeDetailsController extends GetxController {
  final RxInt currentPage = 0.obs;
  final RxBool isExpanded = false.obs;
  final RxInt selectedTab = 0.obs;
  final RxString replyingToCommentId = RxString("");

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void toggleReply(String commentId) {
    if (replyingToCommentId.value == commentId) {
      replyingToCommentId.value = "";
    } else {
      replyingToCommentId.value = commentId;
    }
  }
}
