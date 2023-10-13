
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:leisure_games/ui/html/html_binding.dart';
import 'package:leisure_games/ui/html/html_page.dart';
import 'package:leisure_games/ui/login/login_binding.dart';
import 'package:leisure_games/ui/login/login_page.dart';
import 'package:leisure_games/ui/main/customer_service/customer_service_binding.dart';
import 'package:leisure_games/ui/main/customer_service/service_details/service_details_binding.dart';
import 'package:leisure_games/ui/main/customer_service/service_details/service_details_page.dart';
import 'package:leisure_games/ui/main/home/home_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message/message_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_center_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_center_page.dart';
import 'package:leisure_games/ui/main/home/message_center/message_details/message_details_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_details/message_details_page.dart';
import 'package:leisure_games/ui/main/home/message_center/notice/notice_binding.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_binding.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_page.dart';
import 'package:leisure_games/ui/main/main_binding.dart';
import 'package:leisure_games/ui/main/mine/mine_binding.dart';
import 'package:leisure_games/ui/main/mine/select_animation/select_animation_binding.dart';
import 'package:leisure_games/ui/main/mine/select_animation/select_animation_page.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_binding.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_page.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_binding.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_page.dart';
import 'package:leisure_games/ui/main/mine/select_theme/select_theme_binding.dart';
import 'package:leisure_games/ui/main/mine/select_theme/select_theme_page.dart';
import 'package:leisure_games/ui/main/preferential/preferential_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_page.dart';
import 'package:leisure_games/ui/register/register_binding.dart';
import 'package:leisure_games/ui/register/register_page.dart';

import '../ui/main/main_page.dart';


class Routes {
  static const String main = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String html = "/html";
  static const String select_currency = "/select_currency";
  static const String select_language = "/select_language";
  static const String room_list = "/home/room_list";
  static const String message_center = "/home/message_center";
  static const String select_animation = "/mine/select_animation";
  static const String select_theme = "/mine/select_theme";
  static const String service_details = "/customer_service/service_details";
  static const String message_details = "/message_center/message_details";
  static const String recharge_category = "/recharge/recharge_category";


  static final List<GetPage> getPages=[
    GetPage(name: main, binding: MainBinding(),
        bindings: [HomeBinding(),PreferentialBinding(),RechargeBinding(),
          CustomerServiceBinding(),MineBinding()], page: () => MainPage()),
    // GetPage(name: loading,binding: LoadingBinding(), page: () => LoadingPage()),
    GetPage(name: room_list,binding: RoomListBinding(), page: () => RoomListPage()),
    GetPage(name: login,binding: LoginBinding(), page: () => LoginPage()),
    GetPage(name: register,binding: RegisterBinding(), page: () => RegisterPage()),
    GetPage(name: html,binding: HtmlBinding(), page: () => HtmlPage()),
    GetPage(name: select_currency,binding: SelectCurrencyBinding(), page: () => SelectCurrencyPage()),
    GetPage(name: message_center,binding: MessageCenterBinding(),bindings: [NoticeBinding(),MessageBinding()], page: () => MessageCenterPage()),
    GetPage(name: select_language,binding: SelectLanguageBinding(), page: () => SelectLanguagePage()),
    GetPage(name: select_animation,binding: SelectAnimationBinding(), page: () => SelectAnimationPage()),
    GetPage(name: select_theme,binding: SelectThemeBinding(), page: () => SelectThemePage()),
    GetPage(name: service_details,binding: ServiceDetailsBinding(), page: () => ServiceDetailsPage()),
    GetPage(name: message_details,binding: MessageDetailsBinding(), page: () => MessageDetailsPage()),
    GetPage(name: recharge_category,binding: RechargeCategoryBinding(), page: () => RechargeCategoryPage()),



  ];
  
  
  
  
  

}





