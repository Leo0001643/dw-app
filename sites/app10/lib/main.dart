import 'dart:io';
import 'package:aone_common/common.dart';
import 'package:aone_common/core/app_env.dart';
import 'package:aone_common/router/routes.dart';
import 'package:app10/lang/nationlize.dart';
import 'package:app10/router/router.dart';
import 'package:app10/theme/color_config.dart';
import 'package:app10/theme/custom_theme.dart';
import 'package:app10/theme/theme_loading.dart';
import 'package:app10/theme/theme_scroll_behavior.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:aone_locales/aone_locales.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'config/site_config.dart';
import 'views/base/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  print("--------->kReleaseMode  ${kReleaseMode}");
  print("--------->kReleaseMode  ${AppRuntimeConfig.envConfig.dShieldJson}");
  if (kReleaseMode) {
    var appDomain =
        await getDShieldData(AppRuntimeConfig.envConfig.dShieldJson ?? '');
    AppRuntimeConfig.envConfig.appDomain = appDomain;
    print('打包域名为 == $appDomain');
  }

  AppEnv.setup(
    AppRuntimeConfig.envConfig,
    isCoverConfig: AppRuntimeConfig.isCoverConfig,
  );

  AoneAppTheme.setup(AppColorsConfig.appTheme);
  // DoKit.runApp(
  //   app: DoKitApp(const MyApp()),
  //   useInRelease: false,
  //   useRunZoned: false,
  //   releaseAction: () => {
  //     // release模式下执行该函数
  //   },
  // );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  startJPush();
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://95d63f8974b244bdb4a9e8eb76fd884c@pusha1admin.a1error.com/4';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const MyApp()),
    );
  } else {
    runApp(
      const MyApp(),
    );
  }
}

///初始化极光推送
void startJPush() {
  print("----------开始集成极光");
  JPush jpush = JPush();
  //配置jpush(不要省略）
  //debug就填debug:true，生产环境production:true
  jpush.setup(
      appKey: '2afbb2995c868929dcc7e869',
      channel: 'aone',
      production: true,
      debug: true);
  //监听jpush(ios必须配置)
  jpush.applyPushAuthority(
      const NotificationSettingsIOS(sound: true, alert: true, badge: true));
  jpush.addEventHandler(
    onReceiveNotification: (Map<String, dynamic> message) async {
      print('message11:$message');
    },
    onOpenNotification: (Map<String, dynamic> message) async {
      //点击通知栏消息，在此时通常可以做一些页面跳转等
      print('message22:$message');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'zh';
    return AoneLocale(
      // 请勿移除此builder 否则无法正常初始化
      child: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        translations: Nationalize(),
        locale: const Locale('zh', 'CN'),
        fallbackLocale: const Locale('zh', 'CN'),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: Routes.splash,
        getPages: routers,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        // locale: context.locale,
        // localizationsDelegates: const [
        //   FormBuilderLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('zh', 'CH'),
        //   Locale('hans'),
        //   Locale('en'),
        // ],
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: (context, widget) {
          ScreenUtil.init(
            context,
            designSize: const Size(375, 667),
            splitScreenMode: false,
            minTextAdapt: true,
          );
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: ScrollConfiguration(
              behavior: ThemeScrollBehavior(),
              child: FlutterSmartDialog(
                loadingBuilder: (_, __) => const ThemeLoading(),
                child: widget,
              ),
            ),
          );
        },
      ),
    );
  }
}
