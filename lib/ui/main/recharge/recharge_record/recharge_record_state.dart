import 'package:leisure_games/app/intl/intr.dart';

class RechargeRecordState {
  RechargeRecordState() {
    ///Initialize variables
  }

  var filterTime = [Intr().jintian,Intr().zuijin7tain,Intr().zuijin30tian,];

  var filterWays = [Intr().quanbufangshi,"财付通","点卡支付","京东支付","全民付","QQ转账","银联扫码","USDT币","微信支付","云闪付支付",];

  var filterStatus = [Intr().quanbuzhuangtai,
    Intr().chenggong,Intr().chulizhong,Intr().yiquxiao,];


}
