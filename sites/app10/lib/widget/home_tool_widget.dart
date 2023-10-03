import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:app10/widget/tool/light_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            '快速充值',
            0,
          ),
          _toolbarViewItem(
            'assets/images/home/home_hongbao.png',
            '优惠活动大厅',
            1,
          ),
          _toolbarViewItem(
            'assets/images/home/home_qiandao.png',
            '代理商注册',
            2,
          ),
          _toolbarViewItem(
            'assets/images/home/home_youhuizhongxin.png',
            'app下载',
            3,
          ),
          _toolbarViewItem(
            'assets/images/home/home_downloadcc.png',
            '关于我们',
            4,
          ),
          _toolbarViewItem(
            'assets/images/home/home_downloadcc.png',
            '新手教程',
            5,
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
            break;
          case 5:
            HomePageController.to.downloadccClick();
        }
      },
      child: Column(
        children: [
          DjImage.asset(
            image,
            width: 58.r,
            height: 58.r,
            fit: BoxFit.fill,
          ),
          LightText.buildColor(title, Colors.black)
        ],
      ),
    );
  }
}
