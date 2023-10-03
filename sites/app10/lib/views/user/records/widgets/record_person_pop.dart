import 'package:aone_common/common.dart';
import 'package:app10/views/person_bill_recorder/controllers/person_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class RecordPersonPop extends StatelessWidget {
  final GestureTapCallback? onConfirmTap;
  const RecordPersonPop({Key? key, required this.onConfirmTap})
      : super(key: key);

  _button(String title, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        alignment: Alignment.center,
        // color: Colors.red,
        child: Text(
          title,
          style: TextStyle(
              color: AppTheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.r,
      width: Get.width,
      color: AppTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 44.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _button('取消', () {
                  Get.back();
                }),
                _button('确认', () {
                  Get.back();
                  if (onConfirmTap != null) {
                    onConfirmTap!();
                  }
                }),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: AppTheme.borderColor,
          ),
          Expanded(
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.black, fontSize: 22.sp),
              child: _buildTypePicker(),
            ),
          ),
          SizedBox(
            height: 28.r,
          )
        ],
      ),
    );
  }

  Widget _buildTypePicker() {
    List<SelectEntity> list = getReportListData();
    printInfo(info: "------>" + list.toString());
    // PersonRecordController controller = PersonRecordController.to;
    return Column(
      children: [
        _buildNumberGridList(list),
      ],
    );
  }

  Container _buildNumberGridList(List<SelectEntity> list) {
    List<Widget> listWidget0 = [];
    List<Widget> listWidget = [];
    List<Widget> listWidget1 = [];
    List<Widget> listWidget2 = [];
    List<Widget> listWidget3 = [];
    List<SelectEntity> list0 = RxList();
    List<SelectEntity> list = RxList();
    List<SelectEntity> list1 = RxList();
    List<SelectEntity> list2 = RxList();
    List<SelectEntity> list3 = RxList();

    SelectEntity entity1 =
        SelectEntity(name: "user.center.report.0".tr, value: "");
    list0.add(entity1);
    SelectEntity entity2 =
        SelectEntity(name: "user.center.report.1".tr, value: "1");
    SelectEntity entity3 =
        SelectEntity(name: "user.center.report.2".tr, value: "2");
    SelectEntity entity4 =
        SelectEntity(name: "user.center.report.3".tr, value: "3");
    SelectEntity entity5 =
        SelectEntity(name: "user.center.report.4".tr, value: "4");
    SelectEntity entity6 =
        SelectEntity(name: "user.center.report.5".tr, value: "5");
    SelectEntity entity7 =
        SelectEntity(name: "user.center.report.6".tr, value: "6");

    SelectEntity entity8 =
        SelectEntity(name: "user.center.report.11".tr, value: "11");
    SelectEntity entity9 =
        SelectEntity(name: "user.center.report.12".tr, value: "12");
    SelectEntity entity10 =
        SelectEntity(name: "user.center.report.13".tr, value: "13");

    SelectEntity entity11 = SelectEntity(name: "申请提现", value: "14");

    // SelectEntity entity11 =
    // SelectEntity(name: "user.ce nter.report.14".tr, value: "14");
    list.add(entity2);
    list.add(entity3);
    list.add(entity4);
    list.add(entity5);
    list1.add(entity6);
    list1.add(entity7);
    list2.add(entity8);
    list2.add(entity9);
    list2.add(entity10);
    list3.add(entity11);

    listWidget0.add(_gridNumbersItem(entity1.name ?? "", 0));
    for (int i = 0; i < list.length; i++) {
      SelectEntity subMap = list[i];
      listWidget.add(_gridNumbersItem(subMap.name ?? "", i + 1));
    }

    for (int i = 0; i < list1.length; i++) {
      SelectEntity subMap = list1[i];
      listWidget1.add(_gridNumbersItem(subMap.name ?? "", i + 5));
    }

    for (int i = 0; i < list2.length; i++) {
      SelectEntity subMap = list2[i];
      listWidget2.add(_gridNumbersItem(subMap.name ?? "", i + 7));
    }
    for (int i = 0; i < list3.length; i++) {
      SelectEntity subMap = list3[i];
      listWidget3.add(_gridNumbersItem(subMap.name ?? "", i + 10));
    }

    return Container(
      padding: EdgeInsets.all(15.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: listWidget0,
          ),
          SizedBox(
            height: 15.r,
          ),
          Text("入款：", style: TextStyle(fontSize: 14, color: AppTheme.primary)),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: listWidget,
          ),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: listWidget1,
          ),
          SizedBox(
            height: 15.r,
          ),
          const Text("出款：",
              style: TextStyle(fontSize: 14, color: Color(0xff666666))),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: listWidget2,
          ),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: listWidget3,
          ),
        ],
      ),
    );
  }

  Widget _gridNumbersItem(String title, int index) {
    return GetBuilder<PersonRecordController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.setReportIndex(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 6.r),
            height: 30.r,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.r),
            decoration: BoxDecoration(
              color: _.reportIndex == index
                  ? const Color(0xff007AFF)
                  : Colors.white,
              border: Border.all(width: 1, color: AppTheme.undeer_line_color),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  color: _.reportIndex == index
                      ? AppTheme.onPrimary
                      : AppTheme.underText,
                  fontSize: 14.sp),
            ),
          ),
        );
      },
    );
  }
}
