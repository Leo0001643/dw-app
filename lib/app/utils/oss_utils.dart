
import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/3/19 14:59
/// Description: 阿里云存储工具类
class OssUtils{

  OssUtils._internal();

  static OssUtils? instance;

  static getInstance() {
    instance ??= OssUtils._internal();
    return instance;
  }

  factory OssUtils() => getInstance();

  var accessKey = "****";
  var accessSecret = "****";
  Client? client;

  void initData(){
    client = Client.init(
        ossEndpoint: "oss-accelerate.aliyuncs.com",
        bucketName: "dw-app-lines", authGetter: (){
      return Auth(
        accessKey: accessKey,
        accessSecret: accessSecret,
        expire: '2100-01-01T14:00:00Z',
        secureToken: '',
      );
    });
  }

  void fileList(){
    client?.listObjects({}).then((value) {
      loggerArray(['oss枚举所有文件',value.statusCode,value.statusMessage,value.headers,value.data]);
    },onError: (e){
      logger("报错咯${e}");
    });
  }

  Future<BaseApiOssEntity?> downloadFile() async {
    var result = await client?.getObject(ConfigManager.fileName());
    loggerArray(['获取对象数据',result?.statusCode,result?.statusMessage,result?.headers,result?.data]);
    if(result?.statusCode == 200){
      return BaseApiOssEntity.fromJson(result?.data);
    }
    return null;
  }







}


