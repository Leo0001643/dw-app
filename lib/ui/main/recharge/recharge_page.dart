import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_logic.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  final logic = Get.find<RechargeLogic>();
  final state = Get.find<RechargeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().chongzhizhongxin,
          msg: true, drawer: true, back: false),
      backgroundColor:ColorX.appBarBg(),
      body: SingleChildScrollView(
        child: GetBuilder<WalletController>(
          id: WalletController.wallet_id,
          builder: (ctl) {
            return Column(
              children: [
                Container(
                  height: 100.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return GFAvatar(
                          backgroundImage: WidgetUtils().buildImageProvider(
                              DataUtils.findAvatar(
                                  state.user.value.avatar.em())),
                          radius: 28.r,
                        );
                      }),
                      SizedBox(
                        height: 7.h,
                      ),
                      Obx(() {
                        return Text(
                          Intr().chongzhizhanghu_(
                              [state.user.value.username.em()]),
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorX.text0917()),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                 color: ColorX.cardBg(),
                  padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ctl.wallet
                            ? Intr().wallet_usdt
                            : Intr().dangqianmoren([Intr().wallet_usdt]),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight:FontWeight.w600,color: ColorX.textBlack()),
                      ),
                      Obx(() {
                        return Text(
                          "${Intr().yue_}₮${state.usdtBal.value.money.em()}",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight:FontWeight.w600, color: ColorX.textBlack()),
                        );
                      }),
                    ],
                  ),
                ),
                Obx(() {
                  return buildCategoryItem(state.usdtBank.value, -1);
                }),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 27.w, vertical: 7.h),
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ctl.wallet
                              ? Intr().dangqianmoren([Intr().wallet_cny])
                              : Intr().wallet_cny,
                          style: TextStyle(
                              fontWeight:FontWeight.w600,
                              fontSize: 14.sp, color: ColorX.textBlack()),
                        ),
                        Text(
                          "${Intr().yue_}¥${state.cnyBal.value.money.em()}",
                          style: TextStyle(
                              fontWeight:FontWeight.w600,
                              fontSize: 14.sp, color: ColorX.textBlack()),
                        ),
                      ],
                    );
                  }),
                ),
                Obx(() {
                  var banks = state.paymentList.value.banks;
                  return Column(
                    children: banks
                        ?.map((e) => buildCategoryItem(e, banks.indexOf(e)))
                        .toList() ??
                        [],
                  );
                }),
                SizedBox(
                  height: 30.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildCategoryItem(PaymentListBanks item, int i) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorX.cardBg(),
      ),
      child: InkWell(
        onTap: () {
          if (i == -1) {
            Get.toNamed(Routes.recharge_digital, arguments: item);
          } else {
            Get.toNamed(Routes.recharge_category, arguments: item);
          }
        },
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              WidgetUtils().buildImage(
                item.icon.em(),
                18.r,
                18.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                item.bankName.em(),
                style: TextStyle(fontSize: 14.sp, color: ColorX.textBlack(),fontWeight: FontWeight.w600),
              ),
              Expanded(child: Container()),
              Image.asset(
                ImageX.ic_into_right,
                color: ColorX.icon586(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
