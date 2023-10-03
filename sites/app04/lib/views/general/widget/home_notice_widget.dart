import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../widget/misc/dj_image.dart';
import '../../../widget/tool/light_text.dart';
import '../../../widget/tool/simple_marquee_field.dart';
import '../controllers/home_page_controller.dart';

class HomeNoticeWidget extends StatelessWidget {
  const HomeNoticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _toolbarView();
  }

  Widget _toolbarView() {
    // 滚动公告列表
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.23),
              offset: Offset(2, 2), //阴影y轴偏移量
              blurRadius: 2.0, //阴影模糊程度
              spreadRadius: 2 //阴影扩散程度
              )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.only(top: 6.w, left: 5.w, right: 5.w),
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.w),
        child: GestureDetector(
          onTap: () {
            HomePageController.to.noticeClick();
          },
          child: Container(
            height: 38.w,
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                DjImage.asset(
                  'assets/images/home/home_notice_icon.png',
                  width: 18.w,
                  height: 18.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SimpleMarqueeField(
                    //controller: simpleMarqueeChange,
                    milliseconds: 100,
                    height: 38.w,
                    type: Axis.horizontal,
                    //垂直方向还是水平方向
                    children: <Widget>[
                      ...GlobalService.to.state.scrollNotices
                          .mapIndexed((element, index) => Text(
                                _getSeriContent(index, element.body.toString()),
                                style: TextStyle(
                                  color: const Color(0xFF8A0505),
                                  fontSize: 12.w,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                          .toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getSeriContent(int index, String str) {
    return '${index + 1}、${str.replaceAll("\n", " ")}';
  }
}
