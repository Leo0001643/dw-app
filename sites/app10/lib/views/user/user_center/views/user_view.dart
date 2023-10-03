import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/user/user_center/controller/user_controller.dart';
import 'package:app10/widget/dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../activities/person/views/header_view.dart';
import '../../message_center/message_center_logic.dart';

List LIST_DATA = [
  {'title': '充值记录', 'image': 'user_list_0.png'},
  {'title': '提现记录', 'image': 'user_list_1.png'},
  {'title': '优惠记录', 'image': 'user_list_2.png'},
  {'title': '投注记录', 'image': 'user_list_3.png'},
  {'title': '卡包管理', 'image': 'user_list_4.png'},
  {'title': '消息记录', 'image': 'user_list_5.png'},
  {'title': '修改登录密码', 'image': 'user_list_6.png'},
  {'title': '修改取款密码', 'image': 'user_list_7.png'},
  {'title': '返水记录', 'image': 'user_list_8.png'},
  {'title': '收藏', 'image': 'user_list_9.png'},
  {'title': '推广返利', 'image': 'user_list_10.png'},
  {'title': '优惠中心', 'image': 'user_list_11.png'},
];

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserController());
    return GetBuilder<UserController>(
      autoRemove: true,
      builder: (_) {
        return ThemeScaffold(
            hideBack: true,
            title: '我的',
            backgroundColor: AppTheme.userBgColor,
            leading:
                _appbarItem('msg.png', 0, Alignment.centerLeft, isDot: true),
            actions: [_appbarItem('setting.png', 1, Alignment.centerRight)],
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: PersonHeader(),
                ),
                SizedBox(
                  height: 15.r,
                ),
                _gridView(),
                SizedBox(
                  height: 15.r,
                ),
                if (controller.showBackWater)
                  _footItem('user_foot_0.png', '投注返水', 0),
                _footItem('user_foot_1.png', '优惠活动大厅', 1),
                _footItem('user_foot_2.png', '大转盘', 2),
                _footItem('user_foot_3.png', '关于我们', 3),
                _footItem('user_foot_4.png', 'APP更新', 4),
                SizedBox(
                  height: 20.r,
                ),
                _signOutButton(),
                SizedBox(
                  height: 20.r,
                ),
              ],
            ));
      },
    );
  }

  _appbarItem(String image, int index, AlignmentGeometry alignment,
      {bool? isDot}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.actionsClick(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: alignment,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/user/center/$image',
              width: 20,
              height: 20,
              fit: BoxFit.fitWidth,
            ),
            if (isDot == true)
              Positioned(
                  top: 1,
                  right: 1,
                  child: Obx(() => Visibility(
                        visible: (controller.needEntity.messageCount ?? 0) > 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(2)),
                          width: 4,
                          height: 4,
                        ),
                      )))
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return Container(
      height: 290.r,
      padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
      decoration: BoxDecoration(
          color: AppTheme.userBgColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: GridView.count(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1,
        children: _buildGridList(),
      ),
    );
  }

  List<Widget> _buildGridList() {
    List<Widget> listWidget = [];
    //去掉全民推广
    if (UserService.to.state.userYjInfo.isQm == '2' && LIST_DATA.length == 12) {
      LIST_DATA.removeAt(10);
    }
    for (int i = 0; i < LIST_DATA.length; i++) {
      Map subMap = LIST_DATA[i];
      listWidget.add(_gridItem(subMap['title'], subMap['image'], i));
    }
    return listWidget;
  }

  Widget _gridItem(String title, String imageName, int index) {
    return GestureDetector(
      onTap: () {
        controller.contentListClick(index);
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  child: Image.asset(
                    'assets/images/user/center/$imageName',
                    fit: BoxFit.contain,
                  ),
                ),
                if (index == 5)
                  Positioned(
                      right: 12.r,
                      top: 12.r,
                      child: Obx(() => Visibility(
                            visible:
                                (controller.needEntity.messageCount ?? 0) > 0,
                            child: Container(
                              width: 6.r,
                              height: 6.r,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          )))
              ],
            ),
            SizedBox(
              height: 5.r,
            ),
            if (index == 7)
              Obx(
                () => Text(
                  UserService.to.state.qkpass ? '修改取款密码' : '设置取款密码',
                  style: TextStyle(
                      color: AppTheme.userMainTextColor, fontSize: 12),
                ),
              ),
            if (index != 7)
              Text(
                title,
                style:
                    TextStyle(color: AppTheme.userMainTextColor, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }

  Widget _footItem(String imgName, String title, int tapIndex) {
    return GestureDetector(
      onTap: () {
        controller.footListClick(tapIndex);
      },
      child: Container(
        height: 50.r,
        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
        decoration: BoxDecoration(
            color: AppTheme.itemBgColor,
            border: Border(
                bottom:
                    BorderSide(width: 1, color: AppTheme.userDividerColor))),
        child: Row(
          children: [
            Image.asset(
              'assets/images/user/center/$imgName',
              width: 20,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: AppTheme.userMainTextColor),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/user/arrow_gray.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  _signOutButton() {
    return Container(
      height: 44,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20.r),
      decoration: BoxDecoration(
          color: AppTheme.userButtonBg,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: TextButton(
        onPressed: () {
          Get.dialog(EasyDialog(
            title: '确认要退出登陆?',
            onConfirm: () {
              controller.logout();
            },
          ));
        },
        child: Text(
          UserService.to.state.isTrial ? '退出试玩账号' : "退出账号",
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
