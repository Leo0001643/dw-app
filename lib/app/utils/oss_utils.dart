
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




}


