import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class RechargeHelpController extends BaseController {
  RechargeProvider provider = RechargeProvider();

  final RxList<PayCourseItem> tutorials = RxList.empty();
  int type = 0;
  @override
  void onInit() {
    super.onInit();
    type = Get.arguments;
    print('类型111 === $type');
    getTutorials();
  }

  void getTutorials() {
    fetchHandler<PayCourseEntity>(provider.getPayCourse(), onSuccess: (res) {
      List<PayCourseItem> items = res.items!;
      items.forEach((element) {
        if (element.type == type) {
          tutorials.add(element);
        }
      });
    });
  }
}
