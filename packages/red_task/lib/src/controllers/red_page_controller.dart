import 'package:aone_common/common.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:red_task/src/entities/entities.dart';
import 'package:red_task/src/red_task_service.dart';
import 'package:red_task/src/widgets/expire_popup.dart';
import 'package:red_task/src/widgets/grab_popup.dart';

import '../provider.dart';

class RedPageController extends BaseController {
  static RedPageController get to => Get.find();
  final RedTaskProvider provider = RedTaskProvider();

  final Rx<RedTaskCenterEntity> _redData = Rx(RedTaskCenterEntity());

  RedTaskCenterEntity get redData => _redData.value;

  set redData(val) => _redData.value = val;

  final RxInt _currentPeriod = 1.obs;
  int get currentPeriod => _currentPeriod.value;
  set currentPeriod(val) => _currentPeriod.value = val;

  final RxInt _currentCid = 0.obs;
  get currentCid => _currentCid.value;
  set currentCid(val) => _currentCid.value = val;

  String get cycleTime {
    // var cycle = redData.cycle;
    // if (cycle != null) {
    //   var dateTimeStr = timeStampIntToStringPeriod(cycle.stime!, cycle.etime!,
    //       format: 'yyyy-MM-dd HH:mm:ss');
    //   return '活动时间: $dateTimeStr';
    // }
    var tmp = 'red.activity.time'.tr;
   

    if (redData.time?.length == 2) {
      //  print('前 = ${redData.time![0].length}');
      //  print('后 = ${redData.time![1].length}');
      // print('11111 = ${'$tmp ${redData.time![0]} ~ ${redData.time![1]}'.length}');

      return '$tmp ${redData.time![0]} ~ ${redData.time![1]}';
    }
    return '';
  }

  String get settleTime {
    var cycle = redData.jsTime;
    var tmp = 'red.activity.endtime'.tr;
    
   
    if (cycle != null) {
      //  print('前1 = ${cycle[0].length}');
      //  print('后1 = ${cycle[1].length}');
      var dateTimeStr = "${cycle[0]} ~ ${cycle[1]}";
      // print('2222 = ${'$tmp $dateTimeStr'.length}');

      return '$tmp $dateTimeStr';
    }
    return '';
  }

  //判断充、打、亏
  List getShowBtnNum(RedTaskItem item) {
    List<Map> nameList = [];

    if (item.deposit != null) {
      nameList.add({
        'name':   getRedTypeShowName('red.deposit'),
        'money': item.deposit,
        'finishState': item.finishDeposit == 1,
        'type': '1'
      });
    }
    if (item.dml != null) {
      nameList.add({
        'name': getRedTypeShowName('red.rolling'),
        'money': item.dml,
        'finishState': item.finishDml == 1,
        'type': '2'
      });
    }
    if (item.profit != null) {
      nameList.add({
        'name': getRedTypeShowName('red.loss'),
        'money': item.profit,
        'finishState': item.finishProfit == 1,
        'type': '3'
      });
    }
    return nameList;
  }

  getRedTypeShowName(String showName){
    print("Key == $showName${RedTaskService.to.showType == 2 ? 2 : ''}");
    return "$showName${RedTaskService.to.showType == 2 ? 2 : ''}".tr; 
  }

  //切割红包数
  handleRedNum(RedTaskItem item) {
    String showNum = '000';
    if (item.redCount! > 999) {
      showNum = '999';
    } else if (item.redCount! > 99) {
      showNum = item.redCount.toString();
    } else if (item.redCount! > 9) {
      showNum = '0${item.redCount.toString()}';
    } else {
      showNum = '00${item.redCount.toString()}';
    }
    return showNum.split('');
  }

  static Map<String, String> gameTypeCN = {
    '彩票': 'lottery',
    '捕鱼': 'fish',
    '电子': 'slot',
    '视讯': 'live',
    '电竞': 'esports',
    '棋牌': 'chess',
    '体育': 'sports',
  };

  static Map<String, String> gameTypeEN = {
    'Lottery': 'lottery',
    'Fishing': 'fish',
    'Electronic': 'slot',
    'Video': 'live',
    'Gaming': 'esports',
    'Chess': 'chess',
    'Sports': 'sports',
  };

  static Map<String, String> gameType2CN = {
    '捕鱼': 'fish',
    '电子': 'slot',
    '视讯': 'live',
    '电竞': 'esports',
    '体育': 'sports',
  };

  static Map<String, String> gameType2EN = {
    'Fishing': 'fish',
    'Electronic': 'slot',
    'Video': 'live',
    'Gaming': 'esports',
    'Sports': 'sports',
  };

  Map<String, String> get gameTypeEnum =>
      Get.locale!.languageCode == 'zh' ? gameTypeCN : gameTypeEN;
  
  Map<String, String> get gameType2Enum =>
      Get.locale!.languageCode == 'zh' ? gameType2CN : gameType2EN;
  bool get isInGrabPeriod {
    final period = redData.grab;
    if (period?.envelopeTime == 3) {
      return true;
    }
    DateTime now = DateTime.now();
    if (period?.envelopeTime == 4) {
      if (redData.style != 2) {
        return now.microsecondsSinceEpoch >=
            DateTime.parse(period!.day!).microsecondsSinceEpoch;
      }
      List<bool> conditions = [];
      bool dayCondition = DateFormat('yyyy-MM-dd').format(now) == period!.day;
      conditions.add(dayCondition);
      if (period.hour![0] == 0 && period.hour![1] == 23) {
        conditions.add(true);
      } else {
        bool hourCondition =
            !(now.hour < period.hour![0] || now.hour > period.hour![1]);
        conditions.add(hourCondition);
      }
      return conditions.every((element) => element == true);
    }
    //  period?.weekDay ?? [];
    if (period!.weekDay!.isNotEmpty) {
      var nowWeek = DateTime(now.year, now.month, now.day).weekday;
      print('星期几${nowWeek}');
      if (period.weekDay!.contains(nowWeek)) {
        return !(now.hour < period.hour![0] || now.hour >= period.hour![1]);
      } else {
        return false;
      }
    }
    //判断星期
    // return startWeek;
    print('现在时间 == ${now.hour}');
    return !(now.hour < period.hour![0] || now.hour >= period.hour![1]);
  }

  Future<void> getRedData() async {
    await fetchHandler<RedTaskCenterEntity>(provider.redTaskCurrent(),
        loading: true, onSuccess: (res) {
      redData = res;
      currentCid = res.cycle!.cid;
    });
  }

  Future<void> getLastRedData() async {
    await fetchHandler<RedTaskCenterEntity>(provider.redTaskLast(),
        loading: true, onSuccess: (res) {
      res.style = redData.style;
      redData = res;
    });
  }

  Future<void> onChangePeriod(int index) async {
    currentPeriod = index;
    index == 1 ? await getRedData() : await getLastRedData();
  }

  Future<void> grabRed(RedTaskItem item) async {
        print('isInGrabPeriod == ${item.status}');

    if (![1, 3, 4].contains(item.status)) {
      return;
    }
    // Get.dialog(ExpirePopup(grab: redData.grab!));
    print('isInGrabPeriod == ${isInGrabPeriod}');
    if (item.status == 3) {
      openGrabRed(item);
      return;
    } else if (!isInGrabPeriod) {
      Get.dialog(ExpirePopup(grab: redData.grab!));
      return;
    }
    openGrabRed(item);
  }

  void openGrabRed(RedTaskItem item) {
    Get.dialog(
      GrabRedPopup(
        item: item,
        onClose: () => currentPeriod == 1 ? getRedData() : getLastRedData(),
        cycle: redData.cycle!,
      ),
    );
  }

  @override
  void onInit() async {
    await getRedData();
    super.onInit();
  }
}
