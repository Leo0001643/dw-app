import 'package:aone_common/common.dart';

class AppRuntimeConfig {
  // 从dart-define获取SiteTag
  static const String siteTag =
      String.fromEnvironment('siteTag', defaultValue: 'b97');
 
  /*是否覆盖预发域名 true 是覆盖 即是使用siteTag 站点对应_siteConfigs配置，   
                  false是为用预发10域名调试改模版                    */
  static const bool isCoverConfig = true;

  static SiteConfig get currentConfig => _siteConfigs[siteTag]!;

  static AppEnvConfig get envConfig => currentConfig.envConfig;

  static bool get hasNoticeBackground => currentConfig.hasNoticeBackground;

  static bool get isB97Config => siteTag == 'b97';
}

class SiteConfig {
  final AppEnvConfig envConfig; // 环境配置
  final bool hasNoticeBackground; // 公告弹窗是否带

  SiteConfig({
    required this.envConfig,
    this.hasNoticeBackground = true,
  });
}

final Map<String, SiteConfig> _siteConfigs = {
  // 开发环境
  'a02': SiteConfig(
    envConfig: AppEnv.config,
    hasNoticeBackground: false,
  ),

  'a01': SiteConfig(
    envConfig: AppEnvConfig(
      appName: "澳门威尼斯人",
      // appDomain: "https://akk806.com:9909/",
      // appDomain: AppEnv.config.appDomain, //a02
      appDomain: "https://a1ops01.com/",
      siteTag: 'a01',
      //dShieldJson: "a870966a-306f-4532-81d8-160291caa6b4.json",
    ),
    hasNoticeBackground: false,
  ),

  'a10': SiteConfig(
    envConfig: AppEnvConfig(
      appName: "澳门威尼斯人",
      // appDomain: "https://akk806.com:9909/",
      // appDomain: AppEnv.config.appDomain, //a02
      appDomain: "https://pre-qt.a1pre10.com/",
      siteTag: 'a10',
      //dShieldJson: "a870966a-306f-4532-81d8-160291caa6b4.json",
    ),
    hasNoticeBackground: false,
  ),

  'b97': SiteConfig(
    envConfig: AppEnvConfig(
      appName: "1号厅",
      appDomain: 'https://aoneb97.cc/',
      siteTag: 'b97',
      dShieldJson: "55b8dbec-409f-4f06-988a-98f9a77bb79a.json",
    ),
    hasNoticeBackground: false,
  ),
};
