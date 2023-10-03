import 'package:aone_common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';

import '../../../../app_service.dart';
import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';
import '../../../../widget/no_data.dart';
import '../controllers/card_manager_logic.dart';

class CardManagerView extends StatelessWidget {
  const CardManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerLogic());
    var controller = Get.put(CardManagerChildLogic());
    return ThemeScaffold(
      appBar: AppBar(
          title: const Text(
            "卡包管理",
            style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Image(
              width: 25,
              height: 25,
              image: AssetImage(
                'assets/images/home/person_back.png',
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
          )),
      hideBack: true,
      title: 'activity'.tr,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 12.5.r,
          ),
          Obx(() {
            if (controller.state.banks.isEmpty) {
              return _noData();
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.state.banks.length + 1,
                    itemBuilder: (context, index) {
                      if (controller.state.banks.isNotEmpty &&
                          index == controller.state.banks.length) {
                        return _buildBeizhu();
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10.r),
                          child: SwipeActionCell(
                            ///这个key是必要的
                            key: ValueKey(index.toString()),
                            trailingActions: <SwipeAction>[
                              SwipeAction(
                                  title: "删除",
                                  onTap: (CompletionHandler handler) async {
                                    controller.deleteCard(
                                        controller.state.banks[index]);
                                  },
                                  color: Colors.red),
                            ],
                            child: _buildListItem(context, index),
                          ),
                        );
                      }
                    }),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _noData() {
    return Column(
      children: [NoData(title: '你还未添加银行卡'), _addBankView()],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    var controller = CardManagerChildLogic.to;
    bool isEnd = index == controller.state.banks.length;
    if (isEnd) {
      return _buildBeizhu();
    } else {
      var data = controller.state.banks[index];
      return GestureDetector(
        onTap: () {
          debugPrint("跳转银行卡详情");
          controller.state.selIndex = index;
          Get.toNamed(Routes.walletDetail);
        },
        child: Container(
            width: Get.width,
            height: 122.r,
            margin: EdgeInsets.only(
              // bottom: 15.r,
              left: 12.r,
              right: 12.r,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF007AFF),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.bankname,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          data.bankcard,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                  Image.asset('assets/images/user/card_manager_back_name.png'),
                ])
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(
            //         bottom: 5.r,
            //       ),
            //       child: Text(
            //         data.bankname,
            //         style: TextStyle(
            //           color: Color.fromRGBO(0, 0, 0, 1),
            //           fontSize: 18.sp,
            //         ),
            //         maxLines: 1,
            //         textAlign: TextAlign.left,
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(
            //         bottom: 40.r,
            //       ),
            //       child: Text(
            //         data.bankkaihu,
            //         style: TextStyle(
            //           color: Color.fromRGBO(0, 0, 0, 1),
            //           fontSize: 14.sp,
            //         ),
            //         maxLines: 1,
            //         textAlign: TextAlign.left,
            //       ),
            //     ),
            //     Text(
            //       data.bankcard,
            //       style: TextStyle(
            //         color: Color.fromRGBO(0, 0, 0, 1),
            //         fontSize: 14.sp,
            //       ),
            //       maxLines: 1,
            //       textAlign: TextAlign.left,
            //     ),
            //   ],
            // ),
            ),
      );
    }
  }

  Widget _addBankView() {
    return Container(
      margin: EdgeInsets.only(top: 30.r),
      child: GestureDetector(
        onTap: () {
          debugPrint('点击了添加银行卡');
          Get.toNamed(Routes.bankBind);
        },
        child: Chip(
          padding:
              EdgeInsets.only(top: 10.r, left: 80.r, bottom: 10.r, right: 80.r),
          backgroundColor: AppTheme.primary,
          label: Text(
            '添加银行卡',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          avatar: Image.asset('assets/images/user/user_bank_add.png'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    );
  }

  /**
   * 返回底部的界面
   */
  Widget _getBottomView() {
    return Column(
      children: [
        _addBankView(),
        Container(
          width: Get.width,
          padding: EdgeInsets.only(left: 20.r, top: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '备注:',
                style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              _getCustomText('*左滑删除卡片;'),
              _getCustomText('*支持添加多张卡片，请按需求添加;'),
              _getCustomText('*点击已添加的卡片，可对卡片信息进行修改;'),
            ],
          ),
        )
      ],
    );
  }

  _getCustomText(String s) {
    return Text(
      s,
      style: TextStyle(color: Color.fromRGBO(89, 89, 89, 1), fontSize: 12.sp),
    );
  }

  Widget _buildBeizhu() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.bankBind);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 122,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    //设置背景图片
                    image:
                        AssetImage("assets/images/user/person_dot_border.png"),
                    fit: BoxFit.fill,
                  ),
                  //设置圆角
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                        width: 16,
                        height: 16,
                        image:
                            AssetImage("assets/images/user/person_export.png")),
                    Text(
                      "添加",
                      style: TextStyle(fontSize: 16, color: Color(0xFFCCCCCC)),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "备注:",
              style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '修改银行信息请联系 ',
                  style: TextStyle(
                      color: const Color(0xFF666666), fontSize: 12.sp)),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppService.to.toCustomerService();
                    },
                  text: '在线客服',
                  style: TextStyle(color: AppTheme.primary, fontSize: 12.sp)),
            ])),
          ],
        ));
  }
}
