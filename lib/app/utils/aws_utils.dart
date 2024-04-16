
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
/// Author: Soushin-932707629@qq.com
/// Date: 2024/4/15 15:09
/// Description: 亚马逊存储桶
class AwsUtils{

  AwsUtils._internal();

  static AwsUtils? instance;

  static getInstance() {
    instance ??= AwsUtils._internal();
    return instance;
  }

  factory AwsUtils() => getInstance();


  String getBucket(){
    // if(channelName == Constants.channel_boya){
    //   return "boya";
    // }else {
      return "gjz";
    // }
  }


}

