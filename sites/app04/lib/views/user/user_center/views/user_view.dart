import 'package:aone_common/common.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';
import '../../../activities/person/views/header_view.dart';
import '../../message_center/message_center_logic.dart';

const LIST_NUMBERS = [
  {'title': '今日投注额', 'money': '1.00'},
  {'title': '今日充值', 'money': '1.00'},
  {'title': '今日提现', 'money': '1.00'},
  {'title': '总有效投注', 'money': '1.00'},
  {'title': '总返水', 'money': '1.00'},
  {'title': '总优惠', 'money': '1.00'},
];

const LIST_DATA = [
  {'title': '修改提现密码', 'image': 'person_item1.png'},
  {'title': '修改基本信息', 'image': 'person_item2.png'},
  {'title': '卡包管理', 'image': 'person_item3.png'},
  {'title': '修改登录密码', 'image': 'person_item4.png'},
  {'title': '游戏投注记录', 'image': 'person_item5.png'},
  {'title': '充值记录', 'image': 'person_item6.png'},
  {'title': '提现记录', 'image': 'person_item7.png'},
  {'title': '优惠记录', 'image': 'person_item8.png'},
  {'title': '返水记录', 'image': 'person_item9.png'},
  {'title': '推广福利', 'image': 'person_item10.png'},
  {'title': '我的收藏', 'image': 'person_item11.png'},
  {'title': '投注返水', 'image': 'person_item13.png'},
  {'title': '优惠中心', 'image': 'person_item12.png'},
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
          appBar: AppBar(
              title: Text(
                "会员中心",
                style: TextStyle(fontSize: 16, color: AppTheme.topTitle),
              ),
              centerTitle: true,
              actions: [
                _appbarItem(),
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
              )),
          body: Column(
            children: [
              const PersonHeader(),
              Expanded(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom:
                          (50.r + MediaQuery.of(context).viewPadding.bottom),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFBFAF9),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 18.r,
                          ),
                          _gridNumbsView(),
                          SizedBox(
                            height: 9.r,
                          ),
                          _gridView(),
                          _signOutButton(),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  _appbarItem() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (UserService.to.state.isTrial) {
          SmartDialog.showToast('请登录正式账号');
          return;
        }
        Get.toNamed(Routes.message);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerRight,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/user/message.png',
              width: 20,
              height: 20,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Obx(() => Visibility(
                      visible: (controller.needEntity.messageCount ?? 0) > 0,
                      child: Container(
                        decoration: const ShapeDecoration(
                            color: Colors.red, shape: CircleBorder()),
                        width: 8,
                        height: 8,
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _gridNumbsView() {
    return SizedBox(
      height: 250.r,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 2.r,
        //垂直间距
        crossAxisSpacing: 2.r,
        childAspectRatio: 1,
        //宽高比例
        // shrinkWrap: true,
        children: _buildNumberGridList(),
      ),
    );
  }

  Widget _gridView() {
    return SizedBox(
      height: 650.r,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        //垂直间距
        crossAxisSpacing: 2,
        childAspectRatio: 1,
        //宽高比例
        // shrinkWrap: true,
        children: _buildGridList(),
      ),
    );
  }

  List<Widget> _buildNumberGridList() {
    List<Widget> listWidget = [];
    final _userState = UserService.to.state;
    var _stateNumber = [
      double.tryParse(_userState.totalCount.items?.dayBetValid ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
      double.tryParse(_userState.totalCount.items?.dayUserPayTotal ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
      double.tryParse(_userState.totalCount.items?.dayUserTxTotal ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
      double.tryParse(_userState.totalCount.items?.betValid ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
      double.tryParse(_userState.totalCount.items?.userFsTotal ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
      double.tryParse(_userState.totalCount.items?.userYhTotal ?? "0")
              ?.toStringAsFixed(2) ??
          "0",
    ];
    for (int i = 0; i < LIST_NUMBERS.length; i++) {
      Map subMap = LIST_NUMBERS[i];
      listWidget.add(_gridNumbersItem(subMap['title'], _stateNumber[i], i));
    }
    return listWidget;
  }

  Widget _gridNumbersItem(String title, String money, int index) {
    return GestureDetector(
      onTap: () {
        controller.contentNumberClick(index);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        // margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  money,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                ),
                Container(
                  width: 12.r,
                  height: 12.r,
                  margin: EdgeInsets.all(1.r),
                  child: Image.asset('assets/images/user/person_icon_money.png',
                      fit: BoxFit.contain),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              style: const TextStyle(color: Color(0xFF8D8D8D), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGridList() {
    List<Widget> listWidget = [];
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
        height: 127.r,
        width: 113.r,

        // margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/user/$imageName',
              width: 35,
              height: 35,
            ),
            SizedBox(
              height: 5.r,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Color.fromRGBO(75, 75, 75, 1), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Widget _footListView() {
    return Container(
        height: 162 + 57,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: const BoxDecoration(
          // color: Color.fromRGBO(242, 245, 248, 1),
          // color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          physics: const NeverScrollableScrollPhysics(),
          children: _bulidFootList(),
        ));
  }

  _bulidFootList() {
    List<Widget> listWidgets = [];
    listWidgets.add(
      _footItem('优惠中心', 'user_foot_yhzx.png', '每日精彩活动', 0),
    );
    listWidgets.add(_footItem('游戏帮助', 'user_foot_yxbz.png', '存取款/看这里', 1));
    listWidgets.add(_footItem('代理', 'user_foot_yhzx.png', '合作代理', 2));

    return listWidgets;
  }

  _footItem(String title, String imageName, String detTitle, int index) {
    return GestureDetector(
      onTap: () {
        controller.footListClick(index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        height: 48,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 245, 248, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/images/user/$imageName'),
            const SizedBox(
              width: 11,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Color.fromRGBO(75, 75, 75, 1), fontSize: 12),
            ),
            const Spacer(),
            Text(
              detTitle,
              style: const TextStyle(
                  color: Color.fromRGBO(75, 75, 75, 0.4), fontSize: 12),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/images/user/next_image.png'),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  _signOutButton() {
    return Container(
      height: 38,
      width: 265,
      margin: const EdgeInsets.only(left: 55, right: 55),
      decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: TextButton(
        onPressed: () {
          SmartDialog.showToast('退出成功');
          controller.logout();
        },
        child: Text(
          UserService.to.state.isTrial ? '退出试玩账号' : "退出账号",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
