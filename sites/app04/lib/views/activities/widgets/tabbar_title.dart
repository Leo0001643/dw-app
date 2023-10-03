import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/views/general/controllers/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          width: 100.r,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            gradient: isCheck
                ? AppTheme.primaryGradient
              : const LinearGradient(
                    colors: [Color(0xffFFFFFF), Color(0xff1D7E1F1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            border: Border.all(width: 1, color: const Color(0x00ffffff)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Color(isCheck ? 0xffFFFFFF : 0xff0B213B),
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

                        // ctrl.cardClick(sub);
                        // ctrl.startClick(title);
                        // HomePageController
                        //         .to
                        //         .navConfigList[
                        //             HomePageController.to.selectIndex]
                        //         .subChildren![isShowRight ? 0 : 1]
                        //         .gameTag ==
                        //     GameCategoryController.to.argsments.gameTag!;
                      },
                      child: isFirst
                          ? SizedBox()
                          : Text(
                              rightTitle,
                              style: AppTheme.hintTextStyle,
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
