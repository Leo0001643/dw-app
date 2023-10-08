
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:leisure_games/ui/main/customer_service/customer_service_binding.dart';
import 'package:leisure_games/ui/main/home/home_binding.dart';
import 'package:leisure_games/ui/main/mine/mine_binding.dart';
import 'package:leisure_games/ui/main/preferential/preferential_binding.dart';
import '/ui/demo/connect/connect_binding.dart';
import '/ui/demo/connect/connect_page.dart';
import '/ui/demo/count/count_binding.dart';
import '/ui/demo/count/count_page.dart';
import '../ui/main/main_binding.dart';
import '../ui/main/main_page.dart';
import '/ui/demo/multiplex/multiplex_binding.dart';
import '/ui/demo/multiplex/multiplex_page.dart';
import '/ui/demo/rx_dart/rx_dart_binding.dart';
import '/ui/demo/rx_dart/rx_dart_page.dart';
import '/ui/demo/storage/storage_binding.dart';
import '/ui/demo/storage/storage_page.dart';
import '/ui/demo/web/web_binding.dart';
import '/ui/demo/web/web_page.dart';

class Routes {
  static final String main = "/";
  static final String multiplex = "/multiplex";
  static final String count = "/count";
  static final String storage = "/storage";
  static final String connect = "/connect";
  static final String webview = "/webview";
  static final String rx_dart = "/rx_dart";
  // static final String loading = "/loading";


  static final List<GetPage> getPages=[
    GetPage(name: main, binding: MainBinding(),bindings: [HomeBinding(),PreferentialBinding(),CustomerServiceBinding(),MineBinding()], page: () => MainPage()),
    GetPage(name: multiplex,binding: MultiplexBinding(), page: () => MultiplexPage()),
    GetPage(name: count,binding: CountBinding(), page: () => CountPage()),
    GetPage(name: storage,binding: StorageBinding(), page: () => StoragePage()),
    GetPage(name: connect,binding: ConnectBinding(), page: () => ConnectPage()),
    GetPage(name: webview,binding: WebBinding(), page: () => WebPage()),
    GetPage(name: rx_dart,binding: RxDartBinding(), page: () => RxDartPage()),
    // GetPage(name: loading,binding: LoadingBinding(), page: () => LoadingPage()),

  ];

}





