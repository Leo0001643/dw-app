import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/expression_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/phrase_entity.dart';

class GameRoomState {
  GameRoomState() {
    ///Initialize variables
  }

  var title = "".obs;

  var roomType = 1.obs;// 1 普通  2 高级  3 贵宾

  ///房型选择
  var pc28Lotto = Pc28LottoEntity().obs;

  var room = Pc28LottoRoomsTables().obs;

  var expressions = List<ExpressionEntity>.empty(growable: true);
  var phrases = List<PhraseEntity>.empty(growable: true);

}
