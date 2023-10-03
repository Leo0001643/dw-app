import 'package:aone_common/common.dart';
import 'package:generics/src/records/bill_records/bill_records_binding.dart';
import 'package:get/get.dart';

import 'bet_records/bet_detail/bet_records_detail_binding.dart';
import 'bet_records/bet_detail/bet_records_detail_view.dart';
import 'bet_records/bet_records_binging.dart';
import 'bet_records/bet_records_view.dart';
import 'bill_records/bill_record_view.dart';

final List<GetPage> genRecordsRoutes = [
  //游戏投注记录
  GetPage(
    name: Routes.betHistoryRecord,
    page: () => const BetRecordsView(),
    binding: BetRecordsBinding(),
  ),

  //游戏投注详情记录
  GetPage(
    name: Routes.betHistoryDetail,
    page: () => const BetRecordsDetailView(),
    binding: BetRecordsDetailBinding(),
  ),

  //资金记录
  GetPage(
    name: Routes.personRecord,
    page: () => const BillRecordsView(),
    binding: BillRecordsBinding(),
  ),
];
