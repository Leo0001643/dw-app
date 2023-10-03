import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/utils/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:get/get.dart';
import 'detail_drop_item.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BetBackwaterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
      decoration: BoxDecoration(
          color: AoneAppTheme.appTheme.fsDetailSecondBg,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailDropItem(
            hintText: controller.yxType.isNotEmpty ? controller.yxType : "游戏类型",
            items: dropdownItems(),
            onChanged: (value) {
              LadderItems? entity = value as LadderItems?;
              for (int i = 0; i < controller.items.length; i++) {
                if (controller.items[i] == entity) {
                  controller.setSelectIndex(i);
                }
              }
            },
          ),
          SizedBox(width: 32.w),
          DetailDropItem(
            hintText: getLimitString(
                controller.yxCs.isNotEmpty ? controller.yxCs : "游戏厂商", 8),
            items: dropdownSubItems(),
            onChanged: (value) {
              SubItems? entity = value as SubItems?;
              for (int i = 0; i < controller.subItems.length; i++) {
                if (controller.subItems[i] == entity) {
                  controller.setSubSelectIndex(i);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<LadderItems>> dropdownItems() {
    List<DropdownMenuItem<LadderItems>> menuItemList = RxList();
    List<LadderItems> list = controller.items;
    for (int i = 0; i < list.length; i++) {
      menuItemList.add(
        DropdownMenuItem(
            value: list[i],
            child: Container(
              decoration: BoxDecoration(
                  color: AoneAppTheme.appTheme.fsDetailSecondBg,
                  border: Border.all(
                      color: AoneAppTheme.appTheme.fsDetailPrimary ??
                          Colors.transparent,
                      width: 0.5.w)),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(list[i].label ?? "",
                      style: TextStyle(
                        fontSize: 14.w,
                        color: AoneAppTheme.appTheme.fsDetailPrimary,
                      ))),
            )),
      );
    }
    return menuItemList;
  }

  List<DropdownMenuItem<SubItems>> dropdownSubItems() {
    BetBackwaterController controller = BetBackwaterController.to;
    List<DropdownMenuItem<SubItems>> menuItemList = RxList();
    List<SubItems> list = controller.subItems;
    for (int i = 0; i < list.length; i++) {
      menuItemList.add(
        DropdownMenuItem(
            value: list[i],
            child: Container(
              decoration: BoxDecoration(
                color: AoneAppTheme.appTheme.fsDetailSecondBg,
                border: Border.all(
                    color: AoneAppTheme.appTheme.fsDetailPrimary ??
                        Colors.transparent,
                    width: 0.5.w),
              ),
              child: Center(
                child: Text(getLimitString(list[i].nameCn ?? "", 6),
                    style: TextStyle(
                      fontSize: 14.w,
                      color: AoneAppTheme.appTheme.fsDetailPrimary,
                    )),
              ),
            )),
      );
    }
    return menuItemList;
  }
}
