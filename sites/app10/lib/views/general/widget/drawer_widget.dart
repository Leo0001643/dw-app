import 'package:aone_common/common.dart';
import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../authenticate/widget/register_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.homeBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Container(
              padding: EdgeInsets.only(
                  top: 20.r + MediaQuery.of(context).viewPadding.top),
              child: UserService.to.state.isVisitor
                  ? unLogin(context)
                  : login(context))),
          drawerItem(context, '回到首页', 'assets/images/user/drawer1.png', 0),
          drawerItem(context, '会员中心', 'assets/images/user/drawer2.png', 1),
          drawerItem(context, 'USDT充值教程', 'assets/images/user/drawer3.png', 2),
          drawerItem(context, '大转盘', 'assets/images/user/drawer4.png', 3),
          drawerItem(context, '优惠办理大厅', 'assets/images/user/drawer5.png', 4),
          GetBuilder<MainTabbarController>(
            builder: (controller) {
              if (controller.isHideAgent) {
                return const SizedBox.shrink();
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  drawerItem(
                      context, '代理加盟', 'assets/images/user/drawer7.png', 6),
                  drawerItem(
                      context, '代理登陆', 'assets/images/user/drawer8.png', 7),
                ],
              );
            },
          ),
          //
        ],
      ),
    );
  }

  Widget unLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.close_rounded,
                size: 28,
                color: Color(0xFF545454),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.r),
        SizedBox(
            width: 46.r,
            height: 46.r,
            child: const Image(
              image: AssetImage(
                'assets/images/user/default_headerImg.png',
              ),
            )),
        SizedBox(
          height: 10.r,
        ),
        GestureDetector(
          onTap: () {
            MainTabbarController.to.scaffoldKey.currentState?.closeDrawer();
            Get.toNamed(Routes.login);
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffBF2121),
                borderRadius: BorderRadius.circular(4.r)),
            height: 24.r,
            width: 72.r,
            alignment: Alignment.center,
            child: Text(
              '登录',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10.r,
        ),
        GestureDetector(
          onTap: () {
            if (UserService.to.state.isVisitor) {
              MainTabbarController.to.scaffoldKey.currentState?.closeDrawer();
              Get.toNamed(Routes.login, arguments: false);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffC19E52),
                borderRadius: BorderRadius.circular(4.r)),
            height: 24.r,
            width: 72.r,
            alignment: Alignment.center,
            child: Text(
              '免费开户',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10.r,
        ),
      ],
    );
  }

  Widget login(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.close_rounded,
              size: 28,
              color: Color(0xFF545454),
            ),
          ),
        ),
        SizedBox(height: 8.r),
        SizedBox(
            width: 60.r,
            height: 60.r,
            child: const Image(
              image: AssetImage(
                'assets/images/user/default_headerImg.png',
              ),
            )),
        SizedBox(
          height: 20.r,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 36.r),
            child: Text(
              UserService.to.state.authLevel == AuthLevel.trial
                  ? "试玩账号"
                  : UserService.to.state.userName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 6.r,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 36.r),
            child: const Text(
              "账户余额  (元)",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 6.r,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 36.r),
            child: Text(
              decimalString(UserService.to.state.balance),
              style: const TextStyle(
                color: Color(0xFFff7e00),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.r,
        ),
      ],
    );
  }

  // Widget login(BuildContext context) {
  //   return Obx(() {
  //     var name = UserService.to.state.userName;
  //     var amount = decimalString(UserService.to.state.balance);
  //     return Column(children: [
  //       Center(
  //         child: Container(
  //           width: 76.r,
  //           height: 76.r,
  //           decoration: BoxDecoration(
  //               color: Colors.red, //背景颜色
  //               image: const DecorationImage(
  //                   image: NetworkImage(//远程图片
  //                       "https://img.redocn.com/sheying/20200324/shujiashangdeshuji_10870699.jpg"),
  //                   fit: BoxFit
  //                       .cover //cover 等比例的缩放，直到图片的宽和高都充满整个控件为止，图片可以超出控件的范围，显示不完整。
  //                   ),
  //               borderRadius: BorderRadius.circular(38.r) //使整个Container组件变成圆形
  //               ),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 25.r,
  //       ),
  //       GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           width: 72.r,
  //           height: 24.r,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(Radius.circular(5.0.r))),
  //           child: Text(
  //             name,
  //             style: TextStyle(color: Colors.black, fontSize: 12.sp),
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 10.r,
  //       ),
  //       GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           width: 72.r,
  //           height: 24.r,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(Radius.circular(5.0.r))),
  //           child: Row(
  //             children: [
  //               SizedBox(
  //                 width: 16.r,
  //               ),
  //               Text(
  //                 amount,
  //                 style: TextStyle(color: Colors.black, fontSize: 12.sp),
  //               ),
  //               SizedBox(
  //                   width: 10.r,
  //                   height: 10.r,
  //                   child: Image(
  //                     width: 10.r,
  //                     height: 10.r,
  //                     image: const AssetImage(
  //                       'assets/images/user/home_refresh_icon.png',
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       )
  //     ]);
  //   });
  // }

  Widget loginoutWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: const Color.fromRGBO(255, 57, 57, 1),
        ),
        margin: EdgeInsets.only(top: 48.w, right: 10.w),
        padding: EdgeInsets.only(
            left: 15.5.w, top: 14.5.w, bottom: 14.5.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget drawerItem(
      BuildContext context, String title, String icon_str, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        MainTabbarController.to.contentListClick(index);
      },
      child: Container(
        height: 50.r,
        padding: EdgeInsets.only(left: 20.r),
        color: AppTheme.itemBgColor,
        margin: const EdgeInsets.only(bottom: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              width: 18.r,
              height: 18.r,
              image: AssetImage(
                icon_str,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
