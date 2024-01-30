import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class DataAnalysisState {
  DataAnalysisState() {
    ///Initialize variables
  }


  var totalTitle = RxList.empty(growable: true);

  var formTitle = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];


  ///默认tab在特码
  int tabIndex = 0;


}
