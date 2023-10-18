
import 'package:dio/dio.dart';

/// 网络访问 替换getx自带的appConnect
class DioClient {

  DioClient._internal();

  static DioClient? instance;

  static getInstance() {
    if (instance == null) {
      instance = DioClient._internal();
      instance?.onInit();
    }
    return instance;
  }

  factory DioClient() => getInstance();

  final dio = Dio();

  void onInit(){
    dio.options.baseUrl = "https://www.wanandroid.com";
    dio.options.connectTimeout = Duration(seconds: 60);
    dio.options.receiveTimeout = Duration(seconds: 60);
    dio.options.sendTimeout = Duration(seconds: 60);


  }





}


