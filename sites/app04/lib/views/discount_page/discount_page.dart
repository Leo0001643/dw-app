import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/activity_logic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../navigation/ListCheckWidget.dart';


class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivityLogic());
    final _globalState = GlobalService.to.state;
    // Get.put(ActivityLogic());
    return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                _activityType(),
                Expanded(
                  child: _discountList(),
                ),
              ],
            ),
          ),
        );
  }

  const DiscountPage({Key? key}) : super(key: key);

  _activityType() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(3.0)),
      child: Container(
        width: 146,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 0.5, color: Color(0xffBBA482)),
            top: BorderSide(width: 0.5, color: Color(0xffBBA482)),
          ),
        ),
        child: Container(
            child: Obx(
          () => ListView(
            children: _typeItem(),
          ),
        )),
      ),
    );
  }

  _typeItem() {
    final state = ActivityLogic.to.state;
    final logic = ActivityLogic.to;
    List<Widget> _list = [];
    for (int i = 0; i < state.activityTypes.length; i++) {
      var item = state.activityTypes[i];
      var isActive = item.id == state.currentTypeId;
      _list.add(ListCheckWidget(
        title: item.classNameCn!,
        isChecked: isActive,
        selIndext: i,
        changed: (selIndex) {
          logic.onTypeChange(item.id);
        },
      ));
    }
    return _list;
  }

  _discountList() {
    final state = ActivityLogic.to.state;
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => state.pagingController.refresh(),
      ),
      child: PagedListView(
        pagingController: state.pagingController,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        builderDelegate: PagedChildBuilderDelegate<ActivityInfo>(
          itemBuilder: (BuildContext context, item, int index) {
            // if(islo)
            return _discountListItem(item);
          },
          noItemsFoundIndicatorBuilder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'discount.no.data'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _discountListItem(ActivityInfo item) {
    print('图片qtAppSlmg:' + staticImageResolver(item.qtAppSlmg));
    print('是否有角标' + item.qtBiao!);
    // if (item.qtAppSlmg!.isEmpty) return Text('我是空图片');
    return Container(
      width: Get.width,
      height: 120,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: GestureDetector(
        onTap: () async {
          // var dto = ActivityDetailDto(id: item.id, typesid: item.type);
          // var res = await ActivityApi.detailV2(dto, noLoading: false);
          // if (res.status == Status.done) {
          //   Get.dialog(
          //     BaseDialog(
          //       title: item.title ?? '',
          //       child: DisCountShow(activityInfo: res.data!.item),
          //     ),
          //   );
          // } else {
          //   SmartDialog.showToast(res.message ?? '请求失败');
          // }
          // print('点击了列表----${item.qtAppContent}');
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              height: 110.h,
              // width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  height: 120.h,
                  fit: BoxFit.fill,
                  imageUrl: staticImageResolver(item.qtAppSlmg),
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            ),
            // if (!item.qtBiao!.contains('0'))
              // Positioned(
              //   left: 0,
              //   top: 0,
              //   width: 50,
              //   child: Image.asset(
              //     // 'assets/images/activity/activity_type_hot.png',
              //     // getActivityLabel(item.qtBiao!),
              //     fit: BoxFit.fill,
              //   ),
              // )
          ],
        ),
      ),
    );
  }
}
