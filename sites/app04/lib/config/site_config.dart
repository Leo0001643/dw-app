import 'package:aone_common/common.dart';

class AppRuntimeConfig {
  /// dev: a02,域名是 https://pre-qt.a1pre10.com/    d盾名称 6aecf8a5-58b4-4232-80e7-2ba253bea048.json
  /// release: 除了 a02 以外的所有域名，正式版必须使用d盾；
  /// isUseDShield: 是否使用d盾域名
  ///   false,域名为 SiteConfig.appDomain；
  ///   true,域名为d盾返回的域名,不是SiteConfig.appDomain;
  ///
  /// release打包注意！！
  /// 1.修改 defaultValue 和 isUseDShield;
  /// 2.添加D盾 (问运维要);
  /// 3.查看main.dart中,'返回d盾域名' (交付之前必须向客服或运维确认域名是否正确);
  /// 4.检查代理登录、客服、app更新，内容是否和当前站点匹配;

  static const String siteTag =
      String.fromEnvironment('siteTag', defaultValue: 'h18');
  static const bool isUseDShield = true;

  /*是否覆盖预发域名 true 是覆盖 即是使用siteTag 站点对应_siteConfigs配置，
                  false是为用预发10域名调试改模版                    */
  static const bool isCoverConfig = true;

  static SiteConfig get currentConfig => _siteConfigs[siteTag]!;
  static AppEnvConfig get envConfig => currentConfig.envConfig;
  static bool get hasNoticeBackground => currentConfig.hasNoticeBackground;
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
    hasNoticeBackground: true,
  ),

  'h09': SiteConfig(
    /**
     *  ios账密：ceshi933 ceshi933000
        安卓账密：ceshi8989 密ceshji89
     */
    envConfig: AppEnvConfig(
        appName: "bet365",
        appDomain: "https://pre-qt.a1pre10.com/",
        siteTag: 'h09',
        dShieldJson: "a870966a-306f-4532-81d8-160291caa6b4.json",
        customUrl:
            'https://vscaue.5qou83yd.com/chatwindow.aspx?siteId=60000906&planId=665344a2-7182-44ed-9562-cb9b6107e727'),
    hasNoticeBackground: true,
  ),

  'h18': SiteConfig(
    envConfig: AppEnvConfig(
        appName: "太阳城集团",
        appDomain: 'https://app.reztxrcj1434.com:8899',
        //"https://pre-qt.a1pre10.com/", // " https://14343z.com/", //H18正式  https://033177.com/#/
        siteTag: 'h18',
        // dShieldJson:
        //     '6aecf8a5-58b4-4232-80e7-2ba253bea048.json', //   "b8f86044-a12e-4c59-b063-d49d0638d7c0.json",
        dShieldJson: 'b8f86044-a12e-4c59-b063-d49d0638d7c0.json',
        customUrl: 'http://tyckf0o1il.06.sb'),
    hasNoticeBackground: true,
  )
};

//是否为H09的红包雨
int showRedType() {
  if (AppRuntimeConfig.siteTag == 'h09') {
    return 2; //红包雨
  }
  return 1; //任务红包
}

bool get isSiteTagH09 {
  return AppRuntimeConfig.siteTag == 'h09';
}

//不同站点区分图片文件
String get siteTagAssets {
  if (isSiteTagH09) {
    return 'h09';
  }
  return 'h18';
}
