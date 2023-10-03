import 'package:aone_common/common.dart';
import 'package:app10/views/modifyinfomation/account_data_view.dart';
import 'package:app10/views/modifyinfomation/bindings/account_data_binding.dart';
import 'package:app10/views/modifyinfomation/bindings/account_datamodify_binding.dart';
import 'package:app10/views/modifyinfomation/bindings/modify_information_binding.dart';
import 'package:app10/views/modifyinfomation/modify_information.dart';
import 'package:app10/views/modifypassword/account_datamodify_view.dart';
// import 'package:app10/views/user/card_manager/views/add_bank_view.dart';
// import 'package:app10/views/user/card_manager/views/bankcard_details_view.dart';
// import 'package:app10/views/user/card_manager/views/card_manager_view.dart';
import 'package:app10/views/user/records/router.dart';
import 'package:app10/views/user/user_center/binding/updgrade_binding.dart';
import 'package:app10/views/user/user_center/views/app_upgrade_view.dart';
import 'package:app10/views/user/user_center/views/password_modify_view.dart';
import 'package:generics/generics.dart';
import 'package:get/get.dart';
import '../activities/bindings/signin_everyday_binding.dart';
import '../activities/views/signin_everyday_view.dart';
import '../collections/bindings/collections_binding.dart';
import '../collections/views/collections_view.dart';
import 'message_center/message_center_binding.dart';
import 'message_center/message_center_view.dart';
import 'message_center/message_details_view.dart';
import 'promotion_rebate/bindings/promotion_rebate_binding.dart';
import 'promotion_rebate/promotion_rebate_view.dart';
import 'user_center/binding/password_modify_binding.dart';

final List<GetPage> userRoutes = [
  ...recordRoutes,
  ...rechargeRoutes,
  // ...userCenterRoutes,
  // GetPage(
  //   name: Routes.article,
  //   page: () => const ArticlePage(),
  //   binding: ArticleBinding(),
  // ),
  //推广返利
  GetPage(
    name: Routes.popularize,
    page: () => PromotionRebateView(),
    binding: PromotionRebateBinding(),
  ),
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
    name: Routes.loginPwdSet,
    page: () => const PasswordModifyView(),
    binding: PasswordModifyBinding(),
  ),
  GetPage(
    name: Routes.myCollect,
    page: () => CollectionsView(),
    binding: CollectionsBinding(),
  ),

  GetPage(
    name: Routes.withdraw,
    page: () => const WithdrawMoneyview(),
    binding: WithdrawMoneyBinding(),
  ),
  //App更新
  // GetPage(
  //   name: Routes.upgrade,
  //   page: () => const AppUpgradeView(),
  //   binding: UpgradeBinding(),
  // ),
  GetPage(
    name: Routes.upgrade,
    page: () => const AppUpdateView(),
    binding: AppUndateBinding(),
  ),
  GetPage(
    name: Routes.upgrade,
    page: () => const AppUpgradeView(),
    binding: UpgradeBinding(),
  ),

  GetPage(
    name: Routes.accountData,
    page: () => const AccountDataView(),
    binding: AccountDataBinding(),
  ),
  GetPage(
    name: Routes.modifyInformationPage,
    page: () => const ModifyInformationPage(),
    binding: ModifyInformationBinding(),
  ),
  GetPage(
    name: Routes.accountDataModify,
    page: () => const AccountDataModifyView(),
    binding: AccountDataModifyBinding(),
  ),
  //签到页
  GetPage(
    name: Routes.signCenter,
    page: () => SigninView(),
    binding: SigninEverydayBinding(),
  ),

  //线上充值
  // GetPage(
  //   name: Routes.onlineDep,
  //   page: () => const RechargeOnlineView(),
  //   binding: RechargeOnlineBinding(),
  // ),
  //充值主页面
  // GetPage(
  //   name: Routes.recharge,
  //   page: () => const RechargeView(),
  //   binding: RechargeBinding(),
  // ),
  //转账汇款
  // GetPage(
  //   name: Routes.transferDep,
  //   page: () => const RechargeTransferView(),
  //   binding: RechargeTransferBinding(),
  // ),

  //充值帮助
  // GetPage(
  //   name: Routes.rechargeTutorial,
  //   page: () => const RechargeHelpView(),
  //   binding: RechargeHelpBinding(),
  // ),
];
