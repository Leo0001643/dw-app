import 'package:aone_common/common.dart';
import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../widget/misc/dj_image.dart';
import '../../../widget/tool/light_text.dart';
import '../../../widget/tool/simple_marquee_field.dart';
import '../theme/color_schema.dart';

class HomeNoticeWidget extends StatelessWidget {
  const HomeNoticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _toolbarView();
  }

  Widget _toolbarView() {
    // 滚动公告列表
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.underBackgroud,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.r),
      margin: EdgeInsets.only(top: 6.r, left: 0.r, right: 6.r),
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.w),
        child: GestureDetector(
          onTap: () {
            HomePageController.to.noticeClick();
          },
          child: Container(
            height: 16.w,
            alignment: Alignment.center,
            child: Row(
              children: [
                DjImage.asset(
                  'assets/images/home/home_notice_icon.png',
                  width: 15.w,
                  height: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                SimpleMarqueeField(
                  //controller: simpleMarqueeChange,
                  milliseconds: 100,
                  //间隔
                  width: ScreenUtil().screenWidth - 38.r,
                  height: 16.w,
                  type: Axis.horizontal,
                  //垂直方向还是水平方向
                  children: <Widget>[
                    ...GlobalService.to.state.scrollNotices
                        .mapIndexed((element, index) => LightText.buildColor(
                            _getSeriContent(index, element.body.toString()),
                            AppTheme.underNotice))
                        .toList()
                  ],
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
