import 'package:aone_common/common.dart';
import 'package:app10/theme/image_util.dart';
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
    // controller.state.banks.add(controller.state.banks[0]);
    // controller.state.banks.add(controller.state.banks[0]);
    // controller.state.banks.add(controller.state.banks[0]);
    // controller.state.banks.add(controller.state.banks[0]);
    return ThemeScaffold(
      title: '卡包管理'.tr,
      backgroundColor: const Color(0xfff3f4f5),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12.5.r,
            ),
            Obx(() {
              if (controller.state.banks.isEmpty) {
                return _noData();
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.state.banks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.only(left: 12.w, right: 12.w, top: 16.w),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: SwipeActionCell(
                            isDraggable: controller.allowDelete,

                            ///这个key是必要的
                            key: ValueKey(
                                '$index-${controller.state.banks[index].id}'),
                            trailingActions: <SwipeAction>[
                              SwipeAction(
                                title: "删除",
                                onTap: (CompletionHandler handler) async {
                                  controller.deleteCard(
                                      controller.state.banks[index]);
                                },
                                color: Colors.red,
                              ),
                            ],
                            child: _buildListItem(context, index),
                          ),
                        ),
                      );
                    });
              }
            }),
            _addBankView(),
          ],
        ),
      ),
    );
  }

  Widget _noData() {
    return const NoData(title: '你还未添加银行卡');
  }

  Widget _buildListItem(BuildContext context, int index) {
    var controller = CardManagerChildLogic.to;

    var data = controller.state.banks[index];
    return GestureDetector(
      onTap: () {
        controller.state.selIndex = index;
        Get.toNamed(Routes.walletDetail);
      },
      child: Container(
        width: 1.sw,
        height: 88.w,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/common/bank_bg.jpg',
            ),
            alignment: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.bankname,
                style: TextStyle(color: Colors.white, fontSize: 16.w),
              ),
              SizedBox(
                height: 6.w,
              ),
              Text(
                data.bankcard,
                style: TextStyle(color: Colors.white, fontSize: 16.w),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addBankView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 70.w, bottom: 15.w),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.bankBind);
              },
              child: Container(
                height: 36.w,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xffC19E52),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  '前往绑定卡片',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.w,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "备注:",
            style: TextStyle(
              fontSize: 12.w,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.w),
          Text(
            "可以添加多张卡片，请按需求添加",
            style: TextStyle(
              fontSize: 12.w,
              color: const Color(0xff949494),
            ),
          ),
        ],
      ),
    );
  }
}
