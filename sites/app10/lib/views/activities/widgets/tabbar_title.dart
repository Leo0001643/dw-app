import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../../general/controllers/home_page_controller.dart';

class TabBarTitle extends StatelessWidget {
  final String title;
  bool isFirst = false;
  final bool isCheck;
  String rightTitle;
  final bool isShowRight;
  int index = 0;
  int type; //游戏类型
  TabBarTitle(
      {Key? key,
      required this.title,
      this.isCheck = false,
      this.rightTitle = "",
      this.isFirst = false,
      this.index = 0,
      this.isShowRight = false,
      this.type = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 31.r,
          width: 92.r,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xFF000000),
              Color(0xFF4B4B4B),
            ]),
            color: isCheck
                ? AppTheme.activityMenuSelectedBg
                : AppTheme.activityItemBg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            border: Border.all(width: 1, color: const Color(0xFFF0EAE7)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color:
                  isCheck ? const Color(0xffFFFFFF) : const Color(0xFF999999),
              fontSize: 12.sp,
            ),
          ),
        ),
        rightTitle != ""
            ? GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('传过来的type == ${type}');

                        final ctrl = HomePageController.to;

                        late Navconfig navconfig;
                        ctrl.navConfigList.forEach((element) {
                          print('element.tag1 == ${element.tag}');
                          print('element.isYs == ${element.isYs}');
                          print('element.nameCn == ${element.nameCn}');
                          int subType = element.subChildren![0].type ?? 2;
                          if (subType == type) {
                            navconfig = element;
                            // List<SubChildren> list = navconfig.subChildren ?? [];

                            // navconfig.subChildren[0];
                          }
                          print('subType == ${subType}');
                        });

                        // List<SubChildren> list = navconfig.subChildren ?? [];
                        int findIndex = 0;
                        printInfo(
                            info:
                                "jett----->title  ${title}  包含${title.contains("棋牌")}");
                        if (type == 2) {
                          //电子
                          List<SubChildren> list = navconfig.subChildren ?? [];
                          for (var i = 0; i < list.length; i++) {
                            SubChildren subChildren = list[i];
                            print(
                                'jett--->基础for循环1====  subChildren.nameCn  ${subChildren.nameCn}  params.nameCn ');
                            if (subChildren.nameCn == title) {
                              print(
                                  'jett--->找到  ${i}  params.nameCn  ${subChildren.nameCn}');
                              findIndex = i;
                              break;
                            }
                          }
                          ctrl.cardClick(
                            navconfig.subChildren![findIndex],
                          );
                        } else if (type == 6) {
                          List<SubChildren> list = navconfig.subChildren ?? [];
                          for (var i = 0; i < list.length; i++) {
                            SubChildren subChildren = list[i];
                            print(
                                'jett--->基础for循环2====  subChildren.nameCn  ${subChildren.nameCn}  ');
                            if (subChildren.nameCn == title) {
                              print(
                                  'jett--->找到  ${i}  params.nameCn  ${subChildren.nameCn}');
                              findIndex = i;
                              break;
                            }
                          }
                          ctrl.cardClick(
                            navconfig.subChildren![findIndex],
                          );
                        }
                      },
                      child: isFirst
                          ? SizedBox()
                          : Text(
                              rightTitle,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppTheme.activityHighlightTextColor),
                            ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    isShowRight
                        ? Image.asset('assets/images/home/icon_rigth_back.png')
                        : const SizedBox(),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
