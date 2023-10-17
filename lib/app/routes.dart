
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
import 'package:leisure_games/ui/main/mine/about/about_binding.dart';
import 'package:leisure_games/ui/main/mine/about/about_page.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/bind_bank_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/bind_bank_page.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/bind_usdt_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/bind_usdt_page.dart';
import 'package:leisure_games/ui/main/mine/coin_exchange/coin_exchange_binding.dart';
import 'package:leisure_games/ui/main/mine/coin_exchange/coin_exchange_page.dart';
import 'package:leisure_games/ui/main/mine/mine_binding.dart';
import 'package:leisure_games/ui/main/mine/promotion_profit/promotion_profit_binding.dart';
import 'package:leisure_games/ui/main/mine/promotion_profit/promotion_profit_page.dart';
import 'package:leisure_games/ui/main/mine/proxy_register/proxy_register_binding.dart';
import 'package:leisure_games/ui/main/mine/proxy_register/proxy_register_page.dart';
import 'package:leisure_games/ui/main/mine/quota_conversion/quota_conversion_binding.dart';
import 'package:leisure_games/ui/main/mine/quota_conversion/quota_conversion_page.dart';
import 'package:leisure_games/ui/main/mine/select_animation/select_animation_binding.dart';
import 'package:leisure_games/ui/main/mine/select_animation/select_animation_page.dart';
import 'package:leisure_games/ui/main/mine/select_avatar/select_avatar_binding.dart';
import 'package:leisure_games/ui/main/mine/select_avatar/select_avatar_page.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_binding.dart';
import 'package:leisure_games/ui/main/mine/select_currency/select_currency_page.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_binding.dart';
import 'package:leisure_games/ui/main/mine/select_language/select_language_page.dart';
import 'package:leisure_games/ui/main/mine/select_theme/select_theme_binding.dart';
import 'package:leisure_games/ui/main/mine/select_theme/select_theme_page.dart';
import 'package:leisure_games/ui/main/mine/setting/set_login_pwd/set_login_pwd_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/set_login_pwd/set_login_pwd_page.dart';
import 'package:leisure_games/ui/main/mine/setting/set_simple_pwd/set_simple_pwd_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/set_simple_pwd/set_simple_pwd_page.dart';
import 'package:leisure_games/ui/main/mine/setting/set_withdraw_pwd/set_withdraw_pwd_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/set_withdraw_pwd/set_withdraw_pwd_page.dart';
import 'package:leisure_games/ui/main/mine/setting/setting_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/setting_page.dart';
import 'package:leisure_games/ui/main/mine/setting/user_info/user_info_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/user_info/user_info_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_apply/withdraw_apply_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_apply/withdraw_apply_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_check/withdraw_check_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_check/withdraw_check_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_result/withdraw_result_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_result/withdraw_result_page.dart';
import 'package:leisure_games/ui/main/preferential/preferential_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_offline/recharge_offline_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_online/recharge_online_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_digital/recharge_digital_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_digital/recharge_digital_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_result/recharge_result_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_result/recharge_result_page.dart';
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
  static const String select_avatar = "/mine/select_avatar";
  static const String setting = "/mine/setting";
  static const String user_info = "/mine/setting/user_info";
  static const String set_withdraw_pwd = "/mine/setting/set_withdraw_pwd";
  static const String set_login_pwd = "/mine/setting/set_login_pwd";
  static const String set_simple_pwd = "/mine/setting/set_simple_pwd";
  static const String service_details = "/customer_service/service_details";
  static const String message_details = "/message_center/message_details";
  static const String recharge_category = "/recharge/recharge_category";
  static const String recharge_digital = "/recharge/recharge_digital";
  static const String recharge_result = "/recharge/recharge_result";
  static const String withdraw = "/mine/withdraw";
  static const String withdraw_check = "/mine/withdraw_check";
  static const String withdraw_apply = "/mine/withdraw_apply";
  static const String withdraw_result = "/mine/withdraw_result";
  static const String bind_bank = "/mine/bind_bank";
  static const String bind_usdt = "/mine/bind_usdt";
  static const String promotion_profit = "/mine/promotion_profit";
  // static const String coin_exchange = "/mine/coin_exchange";
  static const String proxy_register = "/mine/proxy_register";
  // static const String quota_conversion = "/mine/quota_conversion";
  // static const String about = "/mine/about";


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
    GetPage(name: recharge_category,binding: RechargeCategoryBinding(),bindings:
    [RechargeOnlineBinding(),RechargeOfflineBinding()], page: () => RechargeCategoryPage()),
    GetPage(name: select_avatar,binding: SelectAvatarBinding(), page: () => SelectAvatarPage()),
    GetPage(name: setting,binding: SettingBinding(), page: () => SettingPage()),
    GetPage(name: user_info,binding: UserInfoBinding(), page: () => UserInfoPage()),
    GetPage(name: set_withdraw_pwd,binding: SetWithdrawPwdBinding(), page: () => SetWithdrawPwdPage()),
    GetPage(name: set_login_pwd,binding: SetLoginPwdBinding(), page: () => SetLoginPwdPage()),
    GetPage(name: set_simple_pwd,binding: SetSimplePwdBinding(), page: () => SetSimplePwdPage()),
    GetPage(name: recharge_digital,binding: RechargeDigitalBinding(), page: () => RechargeDigitalPage()),
    GetPage(name: recharge_result,binding: RechargeResultBinding(), page: () => RechargeResultPage()),
    GetPage(name: withdraw,binding: WithdrawBinding(), page: () => WithdrawPage()),
    GetPage(name: bind_bank,binding: BindBankBinding(), page: () => BindBankPage()),
    GetPage(name: bind_usdt,binding: BindUsdtBinding(), page: () => BindUsdtPage()),
    GetPage(name: withdraw_apply,binding: WithdrawApplyBinding(), page: () => WithdrawApplyPage()),
    GetPage(name: withdraw_check,binding: WithdrawCheckBinding(), page: () => WithdrawCheckPage()),
    GetPage(name: withdraw_result,binding: WithdrawResultBinding(), page: () => WithdrawResultPage()),
    GetPage(name: promotion_profit,binding: PromotionProfitBinding(), page: () => PromotionProfitPage()),
    // GetPage(name: coin_exchange,binding: CoinExchangeBinding(), page: () => CoinExchangePage()),
    GetPage(name: proxy_register,binding: ProxyRegisterBinding(), page: () => ProxyRegisterPage()),
    // GetPage(name: quota_conversion,binding: QuotaConversionBinding(), page: () => QuotaConversionPage()),
    // GetPage(name: about,binding: AboutBinding(), page: () => AboutPage()),


  ];
  
  
  
  
  

}





