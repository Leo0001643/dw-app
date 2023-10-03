import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../core/app_env.dart';

/**awxsqz111
123456 */
//技术链接1 https://cloud.tencent.com/developer/ask/sof/666482
//技术链接1 https://blog.csdn.net/u013491829/article/details/122220773
Future<String> getDShieldData(String dShieldJson) async {
  if (Platform.isIOS | Platform.isAndroid) {
    return await _getAlternativeData(dShieldJson);
  } else {
    var channel = const MethodChannel('com.example.flutterios.MethodChannel');
    var result = await channel.invokeMethod('sendData', {'name': 'flutter'});
    var name = result['name'];
    var state = result['state'];
    var ports = result['ports'];

    try {
      if (state == '1') {
        var subPorts = ports.toString().substring(6);
        return await _getFirstChoiceData(subPorts, dShieldJson);
      } else {
        return await _getAlternativeData(dShieldJson);
      }
    } catch (err, trace) {
      _onShieldError(err, trace);
      try {
        return await _getAlternativeData(dShieldJson);
      } catch (error, trace2) {
        _onShieldError(err, trace2);
      }
      rethrow;
    }
  }
}



void _onShieldError(Object err, dynamic trace) {
  if (kReleaseMode) {
    Sentry.captureException(err, stackTrace: trace);
    Sentry.captureMessage("""
      error: ${err.toString()}
      message: U盾启动初始化失败
      """);
  } else {
    if (err is DioError) {
      SmartDialog.showToast(err.message + '2');
    }
  }
}

Dio _createDioInstance() {
  final dio = Dio();
  dio.interceptors.add(
    RetryInterceptor(dio: dio, retryDelays: const [
      Duration(seconds: 3),
      Duration(seconds: 3),
      Duration(seconds: 3),
    ]),
  );
  return dio;
}

//盾启动成功(首选)
Future<String> _getFirstChoiceData(String port, String dShieldJson) async {
  print('拼接的${port}');

  print('dShieldJson == ${AppEnv.config.dShieldJson}');

  print('AppEnv.config.dShieldJson == ${AppEnv.config.dShieldJson}');

  var url =
      // "http://127.0.0.1:${port}/static/minfo/6aecf8a5-58b4-4232-80e7-2ba253bea048.json";
      "http://127.0.0.1:${port}/static/minfo/${dShieldJson}";
  var dio = _createDioInstance();
  var result = await dio.get(url);
  print('首选重定向后');
  print(result.data);
  await SpStorage.init();
  SpStorage.setCustomeUrl(result.data['custom']);
  return await getOptimalAppDomain(result.data['site']);
}

//盾启动失败(备选)
Future<String> _getAlternativeData(String dShieldJson) async {

  var url = "https://resource.a1json.com/static/minfo/${dShieldJson}";
  // var url = "https://resource.a1json.com/static/minfo/5bcad486-0c98-4601-8d24-231bd65ef2bd.json";
  var dio = _createDioInstance();
  var result = await dio.get(url);
  print('备选重定向后');
  print(result.data);
  await SpStorage.init();
  SpStorage.setCustomeUrl(result.data['custom']);
  return await getOptimalAppDomain(result.data['site']);
}


//获取最优域名
Future getOptimalAppDomain(String siteUrls) async {
  List<String> urlList = siteUrls.split(',');
  String returnStr = '';
  print('返回个数 == ${urlList.length}');
  // try {
  List<String> urlListFuture = urlList.map((e) {
    var subList = e.split(':');
    var url = 'https://${subList[0]}/';
    // if ((url == 'https://pre-qt.a1pre10.com/')) {
    //   //创造一些不访问不通的域名
    //   url = url + '22';
    // }
    // print('处理后的url = ${url}');
    url = 'https://${e}/';
    return url;
  }).toList();

  /*
  await Future.forEach(
    urlListFuture,
    (String item) async {
      try {
        var res = await Dio().get(item);

        if (res.statusCode == 200) {
          returnStr = res.realUri.toString();
          // return returnStr;
        } else if (res.statusCode == 403) {
          returnStr = res.realUri.toString();
        }
      } catch (err) {
        print('报错 == ${err.toString()}');
        debugPrint(item);
      }
    },
  );
  */
  if (returnStr.isEmpty & urlListFuture.isNotEmpty) {
    returnStr = urlListFuture[0];
  }
  print('returnStr == ${returnStr}');
  return returnStr;
  // print('获取到的状态 ${theFirst.statusCode}');
  // if (theFirst.statusCode == 200) {
  //   return theFirst.realUri.toString();
  // }
  // } catch (err) {
  //   print('无法获取有效链接');
  //   // return 'https://www.xpj15.top'.toString();
  //   // rethrow; 达不到就得用Stream了
  // }
}

/*
//获取最优域名
Future<String> getOptimalAppDomain(String siteUrls) async {
  List<String> urlList = siteUrls.split(',');
  String returnStr = '';
  print('返回个数 == ${urlList.length}');
  for (int i = 0; i < urlList.length; i++) {
    //筛选条件遍历数组的中域名连接情况 待写
    bool _canlink = false;
    var subList = urlList[i].split(':');
    if (subList.isNotEmpty) {
      returnStr = 'https://${subList[0]}';
      Response _headReq = await Dio().get(returnStr);
      if (_headReq.statusCode == 200) {
        _canlink = true;
      }
    }
    print('获取到的域名${returnStr}');
    if (_canlink == true) {
      return returnStr;
    }
  }
  return '不规格的返回';
  // print('筛选后的最优域名${returnStr}');
  // //https://cloud.tencent.com/developer/ask/sof/666482   https://blog.csdn.net/u013491829/article/details/122220773
  // var url = Uri.parse('https://www.xpj13.top');
  // var statusCode1 = await Dio().get('https://www.google.com');

  // // print('HEAD请求获取到到 statusCode：${_headReq.statusCode}\n');
  // // print('返回来的状态${statusCode}');
  // // print('返回来谷歌的状态${statusCode1}');

  // return returnStr;
}
*/

/**
 * {site: www.xpj13.top:9677,
 * www.xpj18.top:9677,
 * www.xpj19.top:9677,
 * www.xpj15.top:9677,
 * www.xpj12.top:9677,
 * custom: https://chatlink123.meiqia.cn/widget/standalone.html?eid=213baca233dbbc6f3d5b0c299dd69f9b}
 *
 *
 *
 */
