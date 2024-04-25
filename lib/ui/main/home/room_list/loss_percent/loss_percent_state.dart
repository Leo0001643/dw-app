import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';

class LossPercentState {
  LossPercentState() {
    ///Initialize variables
  }

  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏

  var pageTitle = "".obs;//页面标题
  var subTitle = "".obs;//页面副标题



  NewsRateEntity? htmlEvent;


}
