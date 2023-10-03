import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/home_page_controller.dart';

class HomeToolWidget extends StatelessWidget {
  const HomeToolWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _toolbarView();
  }

  Widget _toolbarView() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.r,
        vertical: 10.r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _toolbarViewItem(
            'assets/images/home/home_cunkuan.png',
            '存款',
            0,
          ),
          _toolbarViewItem(
            'assets/images/home/home_hongbao.png',
            '红包',
            1,
          ),
          _toolbarViewItem(
            'assets/images/home/home_qiandao.png',
            '签到',
            2,
          ),
          _toolbarViewItem(
            'assets/images/home/home_youhuizhongxin.png',
            '优惠中心',
            3,
          ),
          _toolbarViewItem(
            'assets/images/home/home_downloadcc.png',
            '下载CC',
            4,
          ),

        ],
      ),
    );
  }

  Widget _toolbarViewItem(String image, String title, int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            HomePageController.to.savemoneyClick();
            break;
          case 1:
            HomePageController.to.redpacketClick();
            break;
          case 2:
            HomePageController.to.signClick();
            break;
          case 3:
            HomePageController.to.discountClick();
            break;
          case 4:
            HomePageController.to.downloadccClick();
        }
      },
      child: Column(),
    );
  }
}
