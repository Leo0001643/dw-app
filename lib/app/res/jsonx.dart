
import 'package:leisure_games/app/app_data.dart';

class JsonX{

  static const phoneDataEn = 'assets/json/phoneDataEn';
  static const phoneDataZh = 'assets/json/phoneDataZh';


  static String phoneData(){
    switch(AppData.localeIndex()){
      case 0:
        return phoneDataZh;
      default:
        return phoneDataEn;
    }
  }


}


