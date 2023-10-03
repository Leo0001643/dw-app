import 'package:aone_common/common.dart';
import 'package:app04/tab/views/web_page.dart';
import 'package:app04/views/activities/person/person_page.dart';
import 'package:app04/views/collections/bindings/collections_binding.dart';
import 'package:app04/views/general/bindings/web_binding.dart';
import 'package:app04/views/general/views/customer_service_page.dart';
import 'package:app04/views/general/views/main_tabbar_view.dart';
import 'package:app04/views/home/home.dart';
import 'package:app04/views/modifyinfomation/bindings/modify_information_binding.dart';
import 'package:app04/views/modifyinfomation/modify_information.dart';
import 'package:app04/views/user/start_recharge/binding/recharge_binding.dart';
import 'package:app04/views/user/start_recharge/recharge_view.dart';

import 'package:app04/views/transfer_channel/bindings/transfer_channel_binding.dart';
import 'package:app04/views/user/promotion_rebate/bindings/promotion_rebate_binding.dart';
import 'package:get/get.dart';

import '../activities/person/bindings/person_binding.dart';
import '../collections/views/collections_view.dart';
import '../commission_description/commission_description_binding.dart';
import '../commission_description/commission_description_view.dart';

import '../modifypassword/bindings/modify_password_binding.dart';
import '../modifypassword/modify_password.dart';
import '../transfer_channel/transfer_channel_view.dart';
import '../user/promotion_rebate/promotion_rebate_view.dart';
import 'bindings/customer_service_binding.dart';
import 'bindings/main_tabbar_binding.dart';
import 'views/splash_view.dart';

final List<GetPage> generalRoutes = [
  GetPage(
    name: Routes.main,
    page: () => const MainTabBarView(),
    binding: MainTabbarBinding(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const SplashView(),
  ),
  GetPage(
    name: Routes.webPage,
    page: () => const WebPage(),
    binding: WebBinding(),
  ),
  GetPage(
    name: Routes.webServicePage,
    page: () => const WebServicePage(),
    binding: WebServiceBinding(),
  ),
  GetPage(
    name: Routes.personPage,
    page: () => const PersonPage(),
    binding: PersonBinding(),
  ),

  GetPage(
    name: Routes.modifyPasswordPage,
    page: () => const ModifyPasswordPage(),
    binding: ModifyPasswordBinding(),
  ),

  //佣金说明
  GetPage(
    name: Routes.commissionDes,
    page: () => const CommissionDescriptionView(),
    binding: CommissionDescriptionBinding(),
  ),

  GetPage(
    name: Routes.modifyInformationPage,
    page: () => const ModifyInformationPage(),
    binding: ModifyInformationBinding(),
  ),
  //修改登录密码
  GetPage(
    name: Routes.modifyPasswordPage,
    page: () => const ModifyPasswordPage(),
    binding: ModifyPasswordBinding(),
  ),
  GetPage(
    name: Routes.promotionRebateView,
    page: () => PromotionRebateView(),
    binding: PromotionRebateBinding(),
  ),
  //我的收藏
  GetPage(
    name: Routes.collectionsViewPage,
    page: () => CollectionsView(),
    binding: CollectionsBinding(),
  ),
  //充值银行卡
  GetPage(
    name: Routes.transferChannel,
    page: () => const TransferChannelView(),
    binding: TransferChannelBinding(),
  ),

  GetPage(
    name: Routes.recharge,
    page: () => const RechargeView(),
    binding: RechargeBinding(),
  ),
];
