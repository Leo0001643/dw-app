import 'package:app04/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_scaffold.dart';
import '../controllers/bet_history_controller.dart';

class DateSelectView extends GetView<BetHistoryController> {
  const DateSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<BetHistoryController>(builder: (_) {
      return ThemeScaffold(
        title: '游戏投注记录',
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                  width: 375.r,
                  child: Container(
                      width: 359.r,
                      height: 107.r,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 14.r, top: 26.r),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Container(
                                  child: Text("投注记录",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff0B213B))),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.r,
                          ),
                          getWidget(context),
                          SizedBox(
                            height: 14.r,
                          ),
                          getContainerWidget(context),
                          SizedBox(
                            height: 54.r,
                          ),
                          NoData(title: "暂无投注记录")
                        ],
                      )),
                )),
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 375,
                  height: 46.r,
                  decoration: BoxDecoration(
                    color: const Color(0xff2F72F5),
                  ),
                  child: Row(
                    children: [
                      Container(
                          child: Row(children: [
                        SizedBox(
                          width: 24.r,
                        ),
                        Text(
                          "合计：",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFFFFFF)),
                        ),
                        SizedBox(
                          width: 250.r,
                        ),
                        Text(
                          "0元",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFFFFFF)),
                        )
                      ]))
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }

  Widget getWidget(BuildContext context) {
    List<String> dateList = [
      "请选择",
      "user.center.report.yesterday".tr,
      "user.center.report.sevenday".tr,
      "user.center.report.thirtyday".tr
    ];
    List<Widget> widgetList = [];
    for (int i = 0; i < dateList.length; i++) {
      var myContainer = InkWell(
          onTap: () {
            // toMainPage(context,i);
          },
          child: Container(
              height: 25.r,
              width: 74.r,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: i == 0 ? 14 : 12),
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              //边框设置
              decoration: BoxDecoration(
                color: const Color(0xff2F73F5),
                //设置四周圆角 角度
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                //设置四周边框
                border: Border.all(width: 1, color: const Color(0xff3E3E42)),
              ),
              child: Text(dateList[i],
                  style: const TextStyle(
                      fontSize: 12.6, color: Color(0xffFFFFFF)))));
      widgetList.add(myContainer);
    }
    return Container(
        width: 375.r,
        height: 40.r,
        alignment: Alignment.center,
        child: Container(child: Row(children: widgetList)));
  }

  Widget getContainerWidget(BuildContext context) {
    List<String> dateList = ["所有", "体育", "电竞", "棋牌", "视讯", "彩票", "捕鱼"];
    List<Widget> widgetList = [];
    for (int i = 0; i < dateList.length; i++) {
      var myContainer = InkWell(
          onTap: () {
            // toMainPage(context,i);
          },
          child: Container(
              height: 25.r,
              width: 62.r,
              alignment: Alignment.topCenter,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              //边框设置
              decoration: BoxDecoration(
                color: const Color(0xffD7E1F1),
                //设置四周圆角 角度
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                //设置四周边框
                border: Border.all(width: 1, color: const Color(0xffD7E1F1)),
              ),
              child: Text(dateList[i],
                  style: const TextStyle(
                      fontSize: 12.6, color: Color(0xff0B213B)))));
      widgetList.add(myContainer);
    }
    return Container(
        width: 375.r,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
        alignment: Alignment.topLeft,
        child: Container(
            child:
                Wrap(runSpacing: 10.r, spacing: 14.r, children: widgetList)));
  }
}
