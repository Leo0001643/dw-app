import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_params.dart';

class ProfitRebateState {
  ProfitRebateState() {
    ///Initialize variables
  }

  ///页面参数
  var params = DayReturnWaterDetailsParams().obs;

  ///返水记录
  var record = DayReturnWaterDetailsEntity().obs;


}
