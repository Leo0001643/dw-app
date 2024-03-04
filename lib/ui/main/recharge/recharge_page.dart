import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
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

///充值
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
      backgroundColor:ColorX.cardBg2(),
      body: GetBuilder<WalletController>(
        id: WalletController.wallet_id,
        builder: (ctl) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 0.23.sh),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ctl.wallet
                                  ? Intr().wallet_usdt
                                  : Intr().dangqianmoren([Intr().wallet_usdt]),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight:FontWeight.w600,color: ColorX.text5862()),
                            ),
                            Obx(() {
                              return Text(
                                "${Intr().yue_}₮${state.usdtBal.value.money.em()}",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight:FontWeight.w600, color: ColorX.text5862()),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      Obx(() {
                        return Center(
                          child: Wrap(
                            runSpacing: 15.h,
                            spacing: 20.w,
                            children: [
                              buildCategoryItem(state.usdtBank.value, -1),
                              Container(width: 0.4.sw,),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 15.h,),
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
                                    fontSize: 14.sp, color: ColorX.text5862()),
                              ),
                              Text(
                                "${Intr().yue_}¥${state.cnyBal.value.money.em()}",
                                style: TextStyle(
                                    fontWeight:FontWeight.w600,
                                    fontSize: 14.sp, color: ColorX.text5862()),
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBox(height: 15.h,),
                      Obx(() {
                        var banks = state.paymentList.value.banks;
                        return Center(
                          child: Wrap(
                            runSpacing: 15.h,
                            spacing: 20.w,
                            children: banks
                                ?.map((e) => buildCategoryItem(e, banks.indexOf(e)))
                                .toList() ?? [],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1.sw,
                height: 0.28.sh,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageX.mybgT()),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetUtils().buildAppBar(Intr().chongzhizhongxin,
                        msg: true, drawer: true, back: false,bgColor: Colors.transparent),
                    SizedBox(height: 10.h,),
                    Obx(() {
                      return GFAvatar(
                        backgroundImage: WidgetUtils().buildImageProvider(
                            DataUtils.findAvatar(
                                state.user.value.avatar.em())),
                        radius: 28.r,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2.r),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 7.h,),
                    Obx(() {
                      return Text(
                        Intr().chongzhizhanghu_(
                            [state.user.value.username.em()]),
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorX.text0917(),fontWeight: FontWeight.w700),
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCategoryItem(PaymentListBanks item, int i) {

    return Container(
      // margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorX.cardBg12(),
        border: Border.all(color: ColorX.cardBg11(),width: 1.r,),
      ),
      width: 0.4.sw,
      child: InkWell(
        onTap: () {
          jumpPage(item);
        },
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              SizedBox(width: 15.w,),
              WidgetUtils().buildImage(item.icon.em(), 18.r, 18.r,),
              SizedBox(width: 8.w,),
              Text(
                item.bankName.em(),
                style: TextStyle(fontSize: 14.sp, color: ColorX.textBlack(),fontWeight: FontWeight.w600),
              ),
              // Expanded(child: Container()),
              // Image.asset(
              //   ImageX.ic_into_right,
              //   color: ColorX.icon586(),
              //   width: 15.r,
              //   height: 15.r,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  ///页面跳转逻辑
  void jumpPage(PaymentListBanks item) {
    switch(item.bankCode){
      case Constants.code_usdt:
        Get.toNamed(Routes.recharge_digital, arguments: item);
        break;
      case Constants.code_wangyin:
      case Constants.code_zhifubao:
      case Constants.code_weixin:
      case Constants.code_ysfzf:
      case Constants.code_qmf:
      case Constants.code_caifutong:
        Get.toNamed(Routes.recharge_category, arguments: item);
        break;
      default:
        Get.toNamed(Routes.recharge_wallet, arguments: item);
        break;
    }
  }

}
