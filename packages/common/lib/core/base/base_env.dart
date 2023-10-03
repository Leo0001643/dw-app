/*
 * @Author: your name
 * @Date: 2022-02-24 09:27:24
 * @LastEditTime: 2022-02-24 09:28:55
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /aone_flutter/lib/env/e01/env_config.dart
 */
// 环境配置
import 'package:flutter/foundation.dart';

class EnvConfig {
  final String appTitle;
  final String appDomain;
  final String? siteNum;

  EnvConfig({required this.appTitle, required this.appDomain, this.siteNum});
}

// 获取的配置信息
class BaseEnv {
  // 开发环境
  final EnvConfig _debugConfig = EnvConfig(
      appTitle: "Aone02",
      appDomain: "https://pre-qt.a1pre10.com/",
      siteNum: 'c11');

  final EnvConfig _releaseConfig = EnvConfig(
      appTitle: "Aone02",
      appDomain: "https://pre-qt.a1pre10.com/",
      siteNum: 'c11');
//https://6176.app/#/
  EnvConfig get envConfig => _getEnvConfig();

// 根据不同环境返回对应的环境配置
  EnvConfig _getEnvConfig() {
    if (kReleaseMode) {
      // return releaseConfig();
      return _releaseConfig;
    }
    return _debugConfig;
  }

  // 发布环境
  EnvConfig releaseConfig() {
    throw UnimplementedError('请务必复写此方法');
  }
}
