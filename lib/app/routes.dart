
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:leisure_games/ui/login/login_binding.dart';
import 'package:leisure_games/ui/login/login_page.dart';
import 'package:leisure_games/ui/main/customer_service/customer_service_binding.dart';
import 'package:leisure_games/ui/main/home/home_binding.dart';
import 'package:leisure_games/ui/main/home/message/message_binding.dart';
import 'package:leisure_games/ui/main/home/message/message_page.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_binding.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_page.dart';
import 'package:leisure_games/ui/main/mine/mine_binding.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_binding.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_page.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_binding.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_page.dart';
import 'package:leisure_games/ui/main/preferential/preferential_binding.dart';
import 'package:leisure_games/ui/register/register_binding.dart';
import 'package:leisure_games/ui/register/register_page.dart';
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
  static const String main = "/";
  static const String multiplex = "/multiplex";
  static const String count = "/count";
  static const String storage = "/storage";
  static const String connect = "/connect";
  static const String webview = "/webview";
  static const String rx_dart = "/rx_dart";
  // static const String loading = "/loading";
  static const String login = "/login";
  static const String register = "/register";
  static const String select_currency = "/select_currency";
  static const String select_language = "/select_language";
  static const String room_list = "/home/room_list";
  static const String message = "/home/message";


  static final List<GetPage> getPages=[
    GetPage(name: main, binding: MainBinding(),bindings: [HomeBinding(),PreferentialBinding(),CustomerServiceBinding(),MineBinding()], page: () => MainPage()),
    GetPage(name: multiplex,binding: MultiplexBinding(), page: () => MultiplexPage()),
    GetPage(name: count,binding: CountBinding(), page: () => CountPage()),
    GetPage(name: storage,binding: StorageBinding(), page: () => StoragePage()),
    GetPage(name: connect,binding: ConnectBinding(), page: () => ConnectPage()),
    GetPage(name: webview,binding: WebBinding(), page: () => WebPage()),
    GetPage(name: rx_dart,binding: RxDartBinding(), page: () => RxDartPage()),
    // GetPage(name: loading,binding: LoadingBinding(), page: () => LoadingPage()),
    GetPage(name: room_list,binding: RoomListBinding(), page: () => RoomListPage()),
    GetPage(name: login,binding: LoginBinding(), page: () => LoginPage()),
    GetPage(name: register,binding: RegisterBinding(), page: () => RegisterPage()),
    GetPage(name: select_currency,binding: SelectCurrencyBinding(), page: () => SelectCurrencyPage()),
    GetPage(name: message,binding: MessageBinding(), page: () => MessagePage()),
    GetPage(name: select_language,binding: SelectLanguageBinding(), page: () => SelectLanguagePage()),
    // GetPage(name: rx_dart,binding: RxDartBinding(), page: () => RxDartPage()),

  ];
  
  
  
  
  

}





