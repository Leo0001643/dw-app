
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';

class DayReturnWaterDetailsParams{

  String? beginDate;
  String? endDate;
  int? cur;
  BackWaterEntity? details;

  DayReturnWaterDetailsParams({this.details, this.beginDate, this.endDate,this.cur});


  String beginDateStr(){
    if((beginDate?.length ?? 0) >= 10){
      return beginDate!.substring(5);
    }else {
      return beginDate.em();
    }
  }

  String endDateStr(){
    if((endDate?.length ?? 0) >= 10){
      return endDate!.substring(5);
    }else {
      return endDate.em();
    }
  }


}







