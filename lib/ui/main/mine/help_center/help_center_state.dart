import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/help_entity.dart';

class HelpCenterState {
  HelpCenterState() {
    ///Initialize variables
  }


  var aboutList = RxList<HelpEntity>.empty(growable: true);


}
