import 'package:aone_common/common.dart';
import 'package:app04/views/user/records/bindings/backhistory_binding.dart';
import 'package:app04/views/user/records/bindings/bet_history_detail_binding.dart';
import 'package:app04/views/user/records/views/back_history_view.dart';
import 'package:app04/views/user/records/views/bet_history_detail_view.dart';
import 'package:get/get.dart';

import '../../person_bill_recorder/bindings/person_history_binding.dart';
import '../../person_bill_recorder/person_record_view.dart';
import 'bindings/bethistory_binding.dart';
import 'bindings/preferential_history_binding.dart';
import 'bindings/recharge_record_binding.dart';
import 'bindings/withdrawal_history_binding.dart';
import 'views/bet_history_view.dart';
import 'views/preferential_history_view.dart';
import 'views/recharge_record_view.dart';
import 'views/withdrawal_history_view.dart';

final List<GetPage> recordRoutes = [
  //充值记录
  GetPage(
    name: Routes.depositRecord,
    page: () => const RechargeRecordView(),
    binding: RechargeRecordBinding(),
  ),

  GetPage(
    name: Routes.betHistoryRecord,
    page: () => const BetHistoryView(),
    binding: BetHistoryBinding(),
  ),

  GetPage(
    name: Routes.rebateRecord,
    page: () => const BackHistoryView(),
    binding: BackHistoryBinding(),
  ),
  GetPage(
    name: Routes.personRecord,
    page: () => const PersonRecordView(),
    binding: PersonHistoryBinding(),
  ),

  //优惠记录
  GetPage(
    name: Routes.promoRecord,
    page: () => const PreferentialHistoryView(),
    binding: PreferentialHistoryBinding(),
  ),


  //游戏投注详情记录
  GetPage(
    name: Routes.betHistoryDetail,
    page: () => const BetHistoryDetailView(),
    binding: BetHistoryDetailBinding(),
  ),

  //优惠记录
  GetPage(
    name: Routes.promoRecord,
    page: () => const PreferentialHistoryView(),
    binding: PreferentialHistoryBinding(),
  ),
  //游戏提现记录
  GetPage(
    name: Routes.withdrawRecord,
    page: () => const WithdrawalHistoryView(),
    binding: WithdrawalHistoryBinding(),
  ),
];
