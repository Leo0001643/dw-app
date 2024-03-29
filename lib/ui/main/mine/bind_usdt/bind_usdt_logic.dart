import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'bind_usdt_state.dart';

class BindUsdtLogic extends GetxController {
  final BindUsdtState state = BindUsdtState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void loadData() {
    var user = AppData.user();

    // HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username}).then((value) {
    //   state.userDraw.value = value;
    //   state.userDraw.refresh();
    // });

    HttpService.getVMDrawDetail({"oid":user?.oid,"username":user?.username,}).then((value) {
      // state.list = value;
      value.list?.forEach((element) {
        if(element.type?.startsWith('USDT') == true){
          if(unEmpty(element.account)){
            state.list.add(element);
          }
          state.dclist.add(element);
        }
      });
      state.list.refresh();
      state.userDraw.value = value;
      state.userDraw.refresh();
    });

  }


}
