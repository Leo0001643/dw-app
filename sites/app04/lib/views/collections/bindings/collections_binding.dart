import 'package:get/get.dart';

import '../controllers/collections_controller.dart';

class CollectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionsController>(
      () => CollectionsController(),
    );
  }
}
