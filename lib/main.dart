
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'app/app_data.dart';
import 'app/global.dart';
import 'app/intl/intr.dart';
import 'app/logger.dart';
import 'app/route_observers.dart';
import 'app/routes.dart';

void main() {
  Logger.init(tag: 'leisure_games',isDebug: isDebug);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppData.initData();///初始化本地数据
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,//强制竖屏
      DeviceOrientation.portraitDown
    ]);

    var locales = [const Locale('zh','ZH'),const Locale('en','US'),const Locale("de","DE"),const Locale("id","ID")];

    return ScreenUtilInit(
      //填入设计稿中设备的屏幕尺寸,单位dp
        designSize: const Size(375, 778),
        builder: (context,e) => GetMaterialApp(
          translations: Intr(),
          enableLog: true,
          initialRoute: Routes.main,
          getPages: Routes.getPages,
          navigatorObservers: [RouteObservers()],
          locale: locales[0],
          fallbackLocale: locales[1], ///添加一个默认语言选项，以备上面指定的语言翻译 不存在
          supportedLocales: locales,
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate, /// 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, /// 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate, /// 指定默认的文本排列方向, 由左到右或由右到左
          ],
          // builder: (context,widget){
          //   return MediaQuery(///设置文字大小不随系统设置改变
          //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          //       child: widget ?? Container()
          //   );
          // },
        )
    );
  }
}

