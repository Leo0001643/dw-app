import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cashier/start_recharge/widget/no_data.dart';
import '../../../cashier/utils/theme_scaffold.dart';
import '../../../cashier/withdraw_new/widget/page_loading.dart';
import '../../../common_widgets/gen_no_data.dart';
import '../../../common_widgets/gen_theme_scaffold.dart';
import '../widgets/bet_record_detail_cell.dart';
import 'bet_records_detail_controller.dart';

class BetRecordsDetailView extends GetView<BetRecordsDetailController> {
  const BetRecordsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetRecordsDetailController>(
      builder: (_) {
        return GenThemeScaffold(
          backgroundColor: AoneAppTheme.appTheme.recordBgColor,
          title: _.title,
          body: RefreshIndicator(
              // color: AppTheme.primary,
              displacement: 44.0,
              backgroundColor: Colors.grey[200],
              onRefresh: _refresh,
              child: Obx(() {
                if (controller.pageState == PageState.loading) {
                  if (controller.betDetailList.isEmpty) {
                    return const PageLoading();
                  }
                } else if (controller.betDetailList.isEmpty) {
                  return _noDataView();
                }
                return ListView(
                    shrinkWrap: false,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller.scrollController,
                    children: _listViewDetailData());
              })),
        );
      },
    );
  }

  _noDataView() {
    return Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        GenNoData(title: "暂无投注记录")
      ],
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      BetRecordsDetailController controller = BetRecordsDetailController.to;
      controller.onRefresh();
    });
  }

  _listViewDetailData() {
    return controller.betDetailList
        .map((element) => BetRecordDetailCell(element))
        .toList();
  }
}
