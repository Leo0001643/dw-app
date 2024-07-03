
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tencent_captcha/tencent_captcha.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leisure_games/app/app_theme.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app/app_data.dart';
import 'app/global.dart';
import 'app/intl/intr.dart';
import 'app/logger.dart';
import 'app/route_observers.dart';
import 'app/routes.dart';
import 'package:flutter_ume_plus/flutter_ume_plus.dart'; // UME framework
import 'package:flutter_ume_kit_ui_plus/flutter_ume_kit_ui_plus.dart'; // UI kits
import 'package:flutter_ume_kit_device_plus/flutter_ume_kit_device_plus.dart'; // Device info
import 'package:flutter_ume_kit_console_plus/flutter_ume_kit_console_plus.dart'; // Show debugPrint
import 'package:flutter_ume_kit_dio_plus/flutter_ume_kit_dio_plus.dart'; // Dio Inspector


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 请填写你自己的 AppId
  TencentCaptcha.init("189921981");
  Logger.init(tag: 'leisure_games',isDebug: isDebug);
  WidgetsFlutterBinding.ensureInitialized();
  AppData.initData().then((value){
    if (isDebug) {// Register plugin kits
      PluginManager.instance
        ..register(WidgetInfoInspector())
        ..register(WidgetDetailInspector())
        // ..register(ColorSucker())
        // ..register(AlignRuler())
        // ..register(ColorPicker())// New feature
        // ..register(TouchIndicator())
        ..register(CpuInfoPage())
        ..register(DeviceInfoPanel())
        // ..register(Console())
        ..register(DioInspector(dio: HttpService.getDio()));// Pass in your Dio instance
      // After flutter_ume 0.3.0
      runApp(UMEWidget(enable: true, child: MyApp()));
      // Before flutter_ume 0.3.0
      // runApp(injectUMEWidget(child: MyApp(), enable: true));
    } else {
      runApp(MyApp());
    }
  });///初始化本地数据
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,//强制竖屏
      DeviceOrientation.portraitDown
    ]);
    if(AppData.isFirst()){
      Intr().defaultLocale(context);
      AppData.setIsFirst(false);
    }
    return ScreenUtilInit(
      //填入设计稿中设备的屏幕尺寸,单位dp
        designSize: const Size(375, 778),
        builder: (context,e)=> GetMaterialApp(
          translations: Intr(),
          enableLog: true,
          initialRoute: Routes.splash,
          getPages: Routes.getPages,
          navigatorObservers: [defaultLifecycleObserver,RouteObservers()],
          locale: Intr().currentLocale(),
          fallbackLocale: Intr().currentLocale(), ///添加一个默认语言选项，以备上面指定的语言翻译 不存在
          supportedLocales: ConfigManager.locales(),
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate, /// 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, /// 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate, /// 指定默认的文本排列方向, 由左到右或由右到左
          ],
          defaultTransition: Transition.native,
          themeMode: AppTheme().currentTheme(),
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          builder: EasyLoading.init(
              builder: (context,widget)=> MediaQuery(///设置文字大小不随系统设置改变
                  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                  child: widget ?? Container()
              ),
          ),
        ),
    );
  }




}

