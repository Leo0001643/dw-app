import 'package:aone_common/common.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/recharge_help/bindings/recharge_help_binding.dart';
import 'package:generics/src/cashier/recharge_help/recharge_help_view.dart';
import 'package:generics/src/cashier/recharge_online/bindings/recharge_online_binding.dart';
import 'package:generics/src/cashier/recharge_online/recharge_online_view.dart';
import 'package:generics/src/cashier/recharge_transfer/bindings/recharge_transfer_binding.dart';
import 'package:generics/src/cashier/recharge_transfer/recharge_transfer_view.dart';
import 'package:generics/src/cashier/transfer_channel/bindings/transfer_channel_binding.dart';
import 'package:generics/src/cashier/transfer_channel/transfer_channel_view.dart';
import 'package:get/get.dart';

import '../start_recharge/binding/recharge_binding.dart';

final List<GetPage> rechargeRoutes = [
  //线上充值
  GetPage(
    name: Routes.onlineDep,
    page: () => RechargeOnlineView(),
    binding: RechargeOnlineBinding(),
  ),
  //充值主页面
  GetPage(
    name: Routes.recharge,
    page: () => RechargeView(),
    binding: RechargeBinding(),
  ),
  //转账汇款
  GetPage(
    name: Routes.transferDep,
    page: () => RechargeTransferView(),
    binding: RechargeTransferBinding(),
  ),
  //充值帮助
  GetPage(
    name: Routes.rechargeTutorial,
    page: () => RechargeHelpView(),   
    binding: RechargeHelpBinding(),
  ),
  GetPage(
    name: Routes.transferChannel,
    page: () => const TransferChannelView(),
    binding: TransferChannelBinding(),
  ),
];
