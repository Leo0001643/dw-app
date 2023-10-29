import 'package:get/get.dart';

class NumberTrendState {
  NumberTrendState() {
    ///Initialize variables
  }


  RxList<SalesData> data = RxList.empty(growable: true);
  var tabs = ["特码","第一球","第二球","第三球"];


}


class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}


