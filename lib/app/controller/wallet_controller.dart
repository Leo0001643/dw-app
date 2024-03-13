
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';

class WalletController extends GetxController {

  bool get wallet => AppData.wallet();
  static String wallet_id = "changeWallet";


  ///更新全局钱包变化
  void changeWallet(){
    update([wallet_id]);
    refresh();
  }



}

