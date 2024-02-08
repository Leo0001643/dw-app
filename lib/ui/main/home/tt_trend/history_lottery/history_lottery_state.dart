import 'package:get/get.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryLotteryState {
  HistoryLotteryState() {
    ///Initialize variables
  }

  var title = "".obs;

  var hall = HistoryHall();

  var page = 1;

  var list = RxList<HistoryLottoEntity>.empty(growable: true);

  late RefreshController refreshController;
  var refreshListener = RefreshChangeNotifier();

}
