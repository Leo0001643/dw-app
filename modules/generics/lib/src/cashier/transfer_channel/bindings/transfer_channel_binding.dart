import 'package:get/get.dart';

import '../controllers/transfer_channel_controller.dart';

class TransferChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferChannelController());
  }


}