import 'package:get/get.dart';

class PointsRecordState {
  PointsRecordState() {
    ///Initialize variables
  }


  var currentTime = "今日".obs;
  late var times = [currentTime.value,"7日","15日","30日"];

  var record = ["","","","","","","","","","",""].obs;

}
