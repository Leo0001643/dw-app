
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:leisure_games/ui/game_html/game_html_binding.dart';
import 'package:leisure_games/ui/html/html_binding.dart';
import 'package:leisure_games/ui/html/html_page.dart';
import 'package:leisure_games/ui/login/login_binding.dart';
import 'package:leisure_games/ui/login/login_page.dart';
import 'package:leisure_games/ui/login/simple_login/simple_login_binding.dart';
import 'package:leisure_games/ui/login/simple_login/simple_login_page.dart';
import 'package:leisure_games/ui/login/simple_login_var/simple_login_var_binding.dart';
import 'package:leisure_games/ui/login/simple_login_var/simple_login_var_page.dart';
import 'package:leisure_games/ui/main/customer_service/customer_service_binding.dart';
import 'package:leisure_games/ui/main/customer_service/service_details/service_details_binding.dart';
import 'package:leisure_games/ui/main/customer_service/service_details/service_details_page.dart';
import 'package:leisure_games/ui/main/home/chess_game_list/chess_game_list_binding.dart';
import 'package:leisure_games/ui/main/home/chess_game_list/chess_game_list_page.dart';
import 'package:leisure_games/ui/main/home/game_room/betting_details/betting_details_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/betting_details/betting_details_page.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_page.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/number_description/number_description_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/number_source_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/number_source_page.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/prize_number/prize_number_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/tool_check/tool_check_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/data_analysis/data_analysis_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/double_queue/double_queue_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/ds_dew/ds_dew_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/dx_dew/dx_dew_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/lottery_result/lottery_result_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/room_tendency_binding.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/room_tendency_page.dart';
import 'package:leisure_games/ui/main/home/home_binding.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/history_lottery/history_lottery_binding.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/history_lottery/history_lottery_page.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/history_trend/history_trend_binding.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/history_trend/history_trend_page.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/lottery_trend_binding.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/lottery_trend_page.dart';
import 'package:leisure_games/ui/main/home/message_center/message/message_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_center_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_center_page.dart';
import 'package:leisure_games/ui/main/home/message_center/message_details/message_details_binding.dart';
import 'package:leisure_games/ui/main/home/message_center/message_details/message_details_page.dart';
import 'package:leisure_games/ui/main/home/message_center/notice/notice_binding.dart';
import 'package:leisure_games/ui/main/home/points_lottery/points_lottery_binding.dart';
import 'package:leisure_games/ui/main/home/points_lottery/points_lottery_page.dart';
import 'package:leisure_games/ui/main/home/room_list/loss_percent/loss_percent_binding.dart';
import 'package:leisure_games/ui/main/home/room_list/loss_percent/loss_percent_page.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_binding.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_page.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_binding.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_page.dart';
import 'package:leisure_games/ui/main/home/table_game_list/table_game_list_binding.dart';
import 'package:leisure_games/ui/main/home/table_game_list/table_game_list_page.dart';
import 'package:leisure_games/ui/main/main_binding.dart';
import 'package:leisure_games/ui/main/main_page.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail/betting_detail_binding.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail/betting_detail_page.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail2/betting_detail2_binding.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail2/betting_detail2_page.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail_child/betting_detail_child_binding.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail_child/betting_detail_child_page.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail_other/betting_detail_other_binding.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_detail_other/betting_detail_other_page.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_record_binding.dart';
import 'package:leisure_games/ui/main/mine/betting_record/betting_record_page.dart';
import 'package:leisure_games/ui/main/mine/bill_flow/bill_flow_binding.dart';
import 'package:leisure_games/ui/main/mine/bill_flow/bill_flow_page.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/add_bank/add_bank_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/add_bank/add_bank_page.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/bind_bank_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_bank/bind_bank_page.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/add_usdt/add_usdt_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/add_usdt/add_usdt_page.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/bind_usdt_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_usdt/bind_usdt_page.dart';
import 'package:leisure_games/ui/main/mine/bind_wallet/add_wallet/add_wallet_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_wallet/add_wallet/add_wallet_page.dart';
import 'package:leisure_games/ui/main/mine/bind_wallet/bind_wallet_binding.dart';
import 'package:leisure_games/ui/main/mine/bind_wallet/bind_wallet_page.dart';
import 'package:leisure_games/ui/main/mine/bonus_packet/bonus_packet_binding.dart';
import 'package:leisure_games/ui/main/mine/bonus_packet/bonus_packet_page.dart';
import 'package:leisure_games/ui/main/mine/coin_exchange/coin_exchange_binding.dart';
import 'package:leisure_games/ui/main/mine/coin_exchange/coin_exchange_page.dart';
import 'package:leisure_games/ui/main/mine/help_center/help_center_binding.dart';
import 'package:leisure_games/ui/main/mine/help_center/help_center_page.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/bet_amount_rebate/bet_amount_rebate_binding.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/bet_amount_rebate/bet_amount_rebate_page.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/member_rebate_binding.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/member_rebate_page.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/profit_rebate/profit_rebate_binding.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/profit_rebate/profit_rebate_page.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/rebate_detail/rebate_detail_binding.dart';
import 'package:leisure_games/ui/main/mine/member_rebate/rebate_detail/rebate_detail_page.dart';
import 'package:leisure_games/ui/main/mine/mine_binding.dart';
import 'package:leisure_games/ui/main/mine/points_record/points_record_binding.dart';
import 'package:leisure_games/ui/main/mine/points_record/points_record_page.dart';
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
import 'package:leisure_games/ui/main/mine/setting/set_withdraw_pwd/set_withdraw_pwd_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/set_withdraw_pwd/set_withdraw_pwd_page.dart';
import 'package:leisure_games/ui/main/mine/setting/setting_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/setting_page.dart';
import 'package:leisure_games/ui/main/mine/setting/user_info/user_info_binding.dart';
import 'package:leisure_games/ui/main/mine/setting/user_info/user_info_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_apply/withdraw_apply_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_apply/withdraw_apply_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_channel/withdraw_channel_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_channel/withdraw_channel_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_check/withdraw_check_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_check/withdraw_check_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_page.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_result/withdraw_result_binding.dart';
import 'package:leisure_games/ui/main/mine/withdraw/withdraw_result/withdraw_result_page.dart';
import 'package:leisure_games/ui/main/preferential/preferential_binding.dart';
import 'package:leisure_games/ui/main/preferential/preferential_detail/preferential_detail_binding.dart';
import 'package:leisure_games/ui/main/preferential/preferential_detail/preferential_detail_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_category_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_offline/recharge_offline_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_online/recharge_online_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_digital/recharge_digital_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_digital/recharge_digital_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_record/recharge_record_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_record/recharge_record_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_result/recharge_result_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_result/recharge_result_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_wallet/recharge_wallet_binding.dart';
import 'package:leisure_games/ui/main/recharge/recharge_wallet/recharge_wallet_page.dart';
import 'package:leisure_games/ui/register/register_binding.dart';
import 'package:leisure_games/ui/register/register_page.dart';
import 'package:leisure_games/ui/splash/splash_binding.dart';
import 'package:leisure_games/ui/splash/splash_page.dart';

import '../ui/game_html/game_html_page2.dart';
import '../ui/main/mine/setting/set_simple_pwd/set_simple_pwd_page2.dart';

class Routes {
  static const String main = "/";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";
  static const String html = "/html";
  static const String text_timer = "/text_timer";
  static const String game_html = "/game_html";
  static const String select_currency = "/select_currency";
  static const String select_language = "/select_language";
  static const String room_list = "/home/room_list";
  static const String game_room = "/home/game_room";
  static const String number_source = "/home/number_source";
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
  static const String recharge_wallet = "/recharge/recharge_wallet";

  static const String recharge_result = "/recharge/recharge_result";
  static const String withdraw = "/mine/withdraw";
  static const String withdraw_check = "/mine/withdraw_check";
  static const String withdraw_apply = "/mine/withdraw_apply";
  static const String withdraw_result = "/mine/withdraw_result";
  static const String withdraw_channel = "/mine/withdraw_channel";

  static const String bind_bank = "/mine/bind_bank";
  static const String bind_usdt = "/mine/bind_usdt";
  static const String bind_wallet = "/mine/bind_wallet";
  static const String add_wallet = "/mine/add_wallet";

  static const String promotion_profit = "/mine/promotion_profit";
  static const String proxy_register = "/mine/proxy_register";
  static const String quota_conversion = "/mine/quota_conversion";
  // static const String about = "/mine/about";
  static const String help_center = "/mine/help_center";

  static const String coin_exchange = "/mine/coin_exchange";
  static const String bill_flow = "/mine/bill_flow";
  static const String betting_record = "/mine/betting_record";
  static const String betting_detail = "/mine/betting_record/betting_detail";
  static const String betting_detail2 = "/mine/betting_record/betting_detail2";

  static const String betting_detail_child = "/mine/betting_record/betting_detail_child";
  static const String betting_detail_other = "/mine/betting_record/betting_detail_other";

  static const String points_record = "/mine/points_record";
  static const String member_rebate = "/mine/member_rebate";
  static const String profit_rebate = "/mine/profit_rebate";
  static const String bet_amount_rebate = "/mine/bet_amount_rebate";
  static const String bonus_packet = "/mine/bonus_packet";
  static const String lottery_trend = "/home/lottery_trend";
  static const String history_lottery = "/home/history_lottery";
  static const String history_trend = "/home/history_trend";
  static const String betting_details = "/home/betting_details";
  static const String room_tendency = "/home/room_tendency";
  static const String recharge_record = "/home/recharge_record";
  static const String sign_in = "/home/sign_in";
  static const String points_lottery = "/home/points_lottery";
  static const String table_game_list = "/home/table_game_list";
  static const String chess_game_list = "/home/chess_game_list";
  static const String preferential_detail = "/preferential/detail";
  static const String add_bank = "/mine/add_bank";
  static const String add_usdt = "/mine/add_usdt";
  static const String simple_login = "/login/simple_login";
  static const String loss_percent = "/room_list/loss_percent";
  static const String simple_login_var = "/login/simple_login_var";
  static const String rebate_detail = "/member_rebate/rebate_detail";





  static final List<GetPage> getPages=[
    GetPage(name: splash,binding: SplashBinding(), page: () => SplashPage()),
    GetPage(name: main, binding: MainBinding(),
        bindings: [HomeBinding(),PreferentialBinding(),RechargeBinding(),
          CustomerServiceBinding(),MineBinding()], page: () => MainPage()),
    // GetPage(name: loading,binding: LoadingBinding(), page: () => LoadingPage()),
    GetPage(name: room_list,binding: RoomListBinding(), page: () => RoomListPage()),
    GetPage(name: login,binding: LoginBinding(), page: () => LoginPage()),
    GetPage(name: register,binding: RegisterBinding(), page: () => RegisterPage()),
    GetPage(name: html,binding: HtmlBinding(), page: () => HtmlPage()),
    GetPage(name: game_html,binding: GameHtmlBinding(), page: () => GameHtmlPage2()),
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
    GetPage(name: set_simple_pwd,binding: SetSimplePwdBinding(), page: () => SetSimplePwdPage2()),
    GetPage(name: recharge_digital,binding: RechargeDigitalBinding(), page: () => RechargeDigitalPage()),
    GetPage(name: recharge_result,binding: RechargeResultBinding(), page: () => RechargeResultPage()),
    GetPage(name: recharge_wallet,binding: RechargeWalletBinding(), page: () => RechargeWalletPage()),

    GetPage(name: withdraw,binding: WithdrawBinding(), page: () => WithdrawPage()),
    GetPage(name: bind_bank,binding: BindBankBinding(), page: () => BindBankPage()),
    GetPage(name: bind_usdt,binding: BindUsdtBinding(), page: () => BindUsdtPage()),
    GetPage(name: bind_wallet,binding: BindWalletBinding(), page: () => BindWalletPage()),
    GetPage(name: add_wallet,binding: AddWalletBinding(), page: () => AddWalletPage()),

    GetPage(name: withdraw_channel,binding: WithdrawChannelBinding(), page: () => WithdrawChannelPage()),
    GetPage(name: withdraw_apply,binding: WithdrawApplyBinding(), page: () => WithdrawApplyPage()),
    GetPage(name: withdraw_check,binding: WithdrawCheckBinding(), page: () => WithdrawCheckPage()),
    GetPage(name: withdraw_result,binding: WithdrawResultBinding(), page: () => WithdrawResultPage()),
    GetPage(name: promotion_profit,binding: PromotionProfitBinding(), page: () => PromotionProfitPage()),
    GetPage(name: proxy_register,binding: ProxyRegisterBinding(), page: () => ProxyRegisterPage()),
    GetPage(name: quota_conversion,binding: QuotaConversionBinding(), page: () => QuotaConversionPage()),
    // GetPage(name: about,binding: AboutBinding(), page: () => AboutPage()),
    GetPage(name: help_center,binding: HelpCenterBinding(), page: () => HelpCenterPage()),
    GetPage(name: coin_exchange,binding: CoinExchangeBinding(), page: () => CoinExchangePage()),
    GetPage(name: bill_flow,binding: BillFlowBinding(), page: () => BillFlowPage()),
    GetPage(name: betting_record,binding: BettingRecordBinding(), page: () => BettingRecordPage()),
    GetPage(name: betting_detail,binding: BettingDetailBinding(), page: () => BettingDetailPage()),
    GetPage(name: betting_detail2,binding: BettingDetail2Binding(), page: () => BettingDetail2Page()),
    GetPage(name: points_record,binding: PointsRecordBinding(), page: () => PointsRecordPage()),
    GetPage(name: member_rebate,binding: MemberRebateBinding(), page: () => MemberRebatePage()),
    GetPage(name: profit_rebate,binding: ProfitRebateBinding(), page: () => ProfitRebatePage()),
    GetPage(name: bet_amount_rebate,binding: BetAmountRebateBinding(), page: () => BetAmountRebatePage()),
    GetPage(name: bonus_packet,binding: BonusPacketBinding(), page: () => BonusPacketPage()),
    GetPage(name: game_room,binding: GameRoomBinding(), page: () => GameRoomPage()),
    GetPage(name: number_source,binding: NumberSourceBinding(),
        bindings: [PrizeNumberBinding(),NumberDescriptionBinding(),ToolCheckBinding()], page: () => NumberSourcePage()),
    GetPage(name: lottery_trend,binding: LotteryTrendBinding(), page: () => LotteryTrendPage()),
    GetPage(name: history_lottery,binding: HistoryLotteryBinding(), page: () => HistoryLotteryPage()),
    GetPage(name: history_trend,binding: HistoryTrendBinding(), page: () => HistoryTrendPage()),
    GetPage(name: betting_details,binding: BettingDetailsBinding(), page: () => BettingDetailsPage()),
    GetPage(name: room_tendency,binding: RoomTendencyBinding(),
        bindings: [LotteryResultBinding(),DataAnalysisBinding(),DoubleQueueBinding(),DsDewBinding(),DxDewBinding(),NumberTrendBinding()],
        page: () => RoomTendencyPage()),
    GetPage(name: recharge_record,binding: RechargeRecordBinding(), page: () => RechargeRecordPage()),
    GetPage(name: sign_in,binding: SignInBinding(), page: () => SignInPage()),
    GetPage(name: points_lottery,binding: PointsLotteryBinding(), page: () => PointsLotteryPage()),
    GetPage(name: chess_game_list,binding: ChessGameListBinding(), page: () => ChessGameListPage()),
    GetPage(name: table_game_list,binding: TableGameListBinding(), page: () => TableGameListPage()),
    GetPage(name: preferential_detail,binding: PreferentialDetailBinding(), page: () => PreferentialDetailPage()),
    GetPage(name: add_bank,binding: AddBankBinding(), page: () => AddBankPage()),
    GetPage(name: add_usdt,binding: AddUsdtBinding(), page: () => AddUsdtPage()),
    GetPage(name: simple_login,binding: SimpleLoginBinding(), page: () => SimpleLoginPage()),
    GetPage(name: betting_detail_child,binding: BettingDetailChildBinding(), page: () => BettingDetailChildPage()),
    GetPage(name: betting_detail_other,binding: BettingDetailOtherBinding(), page: () => BettingDetailOtherPage()),
    GetPage(name: loss_percent,binding: LossPercentBinding(), page: () => LossPercentPage()),
    GetPage(name: simple_login_var,binding: SimpleLoginVarBinding(), page: () => SimpleLoginVarPage()),
    GetPage(name: rebate_detail,binding: RebateDetailBinding(), page: () => RebateDetailPage()),

  ];
  
  
  
  
  

}





