import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

class GameRoomState {
  GameRoomState() {
    ///Initialize variables
  }

  var title = "房名".obs;

  var roomType = 0;// 0 普通  1 高级  2 贵宾

  ///房型选择
  var pc28Lotto = Pc28LottoEntity().obs;




}
