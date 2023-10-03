import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class AllRechargeHelpController extends BaseController {
  RechargeProvider provider = RechargeProvider();

  final RxList<PayCourseItem> allTutorials = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    getTutorials();
  }

  void getTutorials() {
    fetchHandler<PayCourseEntity>(provider.getPayCourse(), onSuccess: (res) {
      allTutorials.value = res.items!;
    });
  }
}
