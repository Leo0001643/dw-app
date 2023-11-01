import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class NumberTrendState {
  NumberTrendState() {
    ///Initialize variables
  }


  RxList<SalesData> data = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];


}


class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}


