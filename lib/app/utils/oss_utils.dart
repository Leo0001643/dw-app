
import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';

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

  var akeyid = "***";
  var asrt = "***";
  var bucketName = "dw-app-lines";
  var file = "line_gjz.json";
  Client? client;

  void initData(){
    client = Client.init(
        ossEndpoint: "oss-cn-shanghai.aliyuncs.com",
        bucketName: bucketName, authGetter: (){
          return Auth(
            accessKey: akeyid,
            accessSecret: asrt,
            expire: '2100-01-01T14:00:00Z',
            secureToken: 'token',
          );
        });
  }

  void fileList(){
    client?.listObjects({}).then((value) {
      loggerArray(['oss枚举所有文件',value.statusCode,value.statusMessage,value.headers,value.data]);
    },onError: (e){
      logger("报错咯${e}");
    });
    // client?.getObject(fileKey)
  }










}


