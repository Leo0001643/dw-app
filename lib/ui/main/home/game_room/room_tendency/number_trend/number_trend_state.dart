import 'package:leisure_games/app/intl/intr.dart';

class NumberTrendState {
  NumberTrendState() {
    ///Initialize variables
  }


  // RxList<NumberData> data = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  ///默认tab在特码
  int tabIndex = 0;

}


class NumberData {
  NumberData(this.term, this.value);

  final String term;
  final int value;
}


