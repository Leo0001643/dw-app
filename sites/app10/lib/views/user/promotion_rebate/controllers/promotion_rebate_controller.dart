import 'package:aone_common/controllers/popularize/popularize_logic.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class PromotionRebateController extends PopularizeLogic {
  static PromotionRebateController get to => Get.find();

  var isSelect = true.obs;
  var current = 0;

  void changeItem(int index) {
    if (current == index) {
      return;
    }
    current = index;
    print('$current------${isSelect.value}');
    isSelect.value = !isSelect.value;
  }

  var titleList = ['日期', '一级代理', '二级代理', '三级代理'];

  var shareList = [
    const Tuple2(
      'assets/images/user/promotion_rebate_wechat.png',
      '分享给微信好友',
    ),
    const Tuple2(
      'assets/images/user/promotion_rebate_qq.png',
      '分享给QQ好友',
    ),
    const Tuple2(
      'assets/images/user/promotion_rebate_wechatfriend.png',
      '分享到朋友圈',
    ),
    const Tuple2(
      'assets/images/user/promotion_rebate_save.png',
      '保存到相册',
    ),
  ];

  onTapShareList(int index) {
    if (index == 3) {
      saveImg(state.echoImg);
    } else {
      shareImg(state.echoImg);
    }
  }
}
