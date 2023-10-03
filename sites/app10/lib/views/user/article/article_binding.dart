import 'package:get/get.dart';

import 'article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}
