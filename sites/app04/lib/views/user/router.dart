import 'package:aone_common/common.dart';
// import 'package:app04/views/user/card_manager/views/add_bank_view.dart';
// import 'package:app04/views/user/card_manager/views/bankcard_details_view.dart';
// import 'package:app04/views/user/card_manager/views/card_manager_view.dart';
import 'package:app04/views/user/recharge_help/bindings/recharge_help_binding.dart';
import 'package:app04/views/user/recharge_help/recharge_help_view.dart';
import 'package:app04/views/user/recharge_online/bindings/recharge_online_binding.dart';
import 'package:app04/views/user/recharge_online/recharge_online_view.dart';
import 'package:app04/views/user/recharge_transfer/bindings/recharge_transfer_binding.dart';
import 'package:app04/views/user/recharge_transfer/recharge_transfer_view.dart';
import 'package:app04/views/user/records/router.dart';
import 'package:generics/generics.dart';
import 'package:app04/views/user/user_center/binding/updgrade_binding.dart';
import 'package:app04/views/user/user_center/views/app_upgrade_view.dart';
import 'package:app04/views/user/user_center/views/password_modify_view.dart';
import 'package:get/get.dart';
import 'message_center/message_center_binding.dart';
import 'message_center/message_center_view.dart';
import 'message_center/message_details_view.dart';
import 'user_center/binding/password_modify_binding.dart';

final List<GetPage> userRoutes = [
  ...recordRoutes,
  // ...userCenterRoutes,
  // GetPage(
  //   name: Routes.article,
  //   page: () => const ArticlePage(),
  //   binding: ArticleBinding(),
  // ),
  // //推广返利
  // GetPage(
  //   name: Routes.popularize,
  //   page: () => PromotionRebateView(),
  //   binding: PromotionRebateBinding(),
  // ),
  // //佣金说明
  // GetPage(
  //   name: Routes.commissionDes,
  //   page: () => CommissionDescriptionView(),
  //   binding: CommissionDescriptionBinding(),
  // ),
  //消息中心
  GetPage(
    name: Routes.message,
    page: () => const MessageCenterView(),
    binding: MessageCenterBinding(),
  ),
  //消息详情
  GetPage(
    name: Routes.messageDetail,
    page: () => const MessageDetailsView(),
    binding: MessageCenterBinding(),
  ),
  // GetPage(
  //   name: Routes.helpCenter,
  //   page: () => const GameHelpPage(),
  //   binding: GameHelpBinding(),
  // ),
  // GetPage(
  //   name: Routes.qAndA,
  //   page: () => const HelpQuestionPage(),
  //   binding: HelpQuestionBinding(),
  // ),
  GetPage(
    name: Routes.wallet,
    page: () => const CardManagerViewNew(),
  ),
  GetPage(
    name: Routes.walletDetail,
    page: () => const BankcardDetailsViewNew(),
  ),
  GetPage(
    name: Routes.bankEdit,
    page: () => EditBankViewNew(),
  ),
  GetPage(
    name: Routes.bankBind,
    page: () => AddBankViewNew(),
  ),
  GetPage(
    name: Routes.withdraw,
    page: () => const WithdrawMoneyview(),
    binding: WithdrawMoneyBinding(),
  ),
  GetPage(
    name: Routes.loginPwdSet,
    page: () => const PasswordModifyView(),
    binding: PasswordModifyBinding(),
  ),
  // GetPage(
  //   name: Routes.myCollect,
  //   page: () => CollectionsView(),
  //   binding: CollectionsBinding(),
  // ),

  //线上充值
  GetPage(
    name: Routes.onlineDep,
    page: () => const RechargeOnlineView(),
    binding: RechargeOnlineBinding(),
  ),
  GetPage(
    name: Routes.transferDep,
    page: () => const RechargeTransferView(),
    binding: RechargeTransferBinding(),
  ),
  //充值帮助
  GetPage(
    name: Routes.rechargeTutorial,
    page: () => const RechargeHelpView(),
    binding: RechargeHelpBinding(),
  ),
  GetPage(
    name: Routes.upgrade,
    page: () => const AppUpgradeView(),
    binding: UpgradeBinding(),
  ),
];
