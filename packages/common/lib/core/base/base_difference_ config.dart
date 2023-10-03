
class AoneDifferenceConfig {
  static BaseDifferenceConfig appThemeConfig = BaseDifferenceConfig();

  static void setup(BaseDifferenceConfig config) {
    appThemeConfig = config;
  }
  static BaseDifferenceConfig get appTheme => appThemeConfig;

}

class BaseDifferenceConfig {
  final String? siteTag; //站点


  BaseDifferenceConfig(
      {
        this.siteTag,
      });

}
