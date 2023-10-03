import 'package:aone_common/common.dart';
import '../config/site_config.dart';
import 'sites/aone_h09_color_config.dart';
import 'sites/aone_h18_color_config.dart';

abstract class AppColorsConfig {
  static AppThemeConfig get appTheme =>
      _siteColorConfigs[AppRuntimeConfig.siteTag]!;
}

final Map<String, AppThemeConfig> _siteColorConfigs = {
  'h09': getH09AppThemeConfig(),
  'h18': getH18AppThemeConfig(),
};
