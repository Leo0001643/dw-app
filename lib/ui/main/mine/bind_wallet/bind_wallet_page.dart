import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/main.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/main/ends_drawer_view.dart';

import 'bind_wallet_logic.dart';

///绑定其他钱包
class BindWalletPage extends StatefulWidget {
  const BindWalletPage({Key? key}) : super(key: key);

  @override
  State<BindWalletPage> createState() => _BindWalletPageState();
}

class _BindWalletPageState extends State<BindWalletPage> {
  final logic = Get.find<BindWalletLogic>();
  final state = Get.find<BindWalletLogic>().state;

  @override
  void dispose() {
    Get.delete<BindWalletLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMineKey,
      appBar: WidgetUtils().buildAppBar(Intr().bangdingqitaqianbao,
          msg: true, drawer: true, drawEnd: () {
            scaffoldMineKey.currentState?.openEndDrawer();
          }),
      backgroundColor: ColorX.pageBg(),
      endDrawer: EndsDrawerView(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 27.w, top: 31.h, bottom: 20.h),
              child: Obx(() {
                var length = state.list.em();
                return Text(
                  Intr().wodeqitaqianbao_(
                      ["$length", "${state.maxCount - length}"]),
                  style: TextStyle(fontSize: 16.sp, color: ColorX.text0917()),
                );
              }),
            ),
            Obx(() {
              return Visibility(
                visible: unEmpty(state.list),
                child: Column(
                  children: [
                    ...state.list.map((e) => buildBankItem(e)).toList(),
                  ],
                ),
              );
            }),
            Obx(() {
              return Visibility(
                visible: state.list.length < state.maxCount,
                child: InkWell(
                  onTap: ()=> DialogUtils().showSelectUsdtBtmDialog(context, state.dclist).then((value){
                    if(unEmpty(value)){
                      value!.mobile = state.userDraw.value.mobile;
                      Get.toNamed(Routes.add_wallet,arguments: value);
                    }
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg3(),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 181.h,
                    // padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
                    margin: EdgeInsets.symmetric(horizontal: 27.w),
                    child: GFBorder(
                      dashedLine: [5, 7],
                      color: ColorX.text586(),
                      type: GFBorderType.rRect,
                      radius: Radius.circular(10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color: ColorX.iconBlack(),
                              size: 24.r,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            Intr().bangdingqitaqianbao,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: ColorX.text0917(),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            Intr().zuiduoketianjiaqianbao_(["${state.maxCount}"]),
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorX.text586()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: Intr().qitaqianbaowenxintis,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorX.text586(), height: 1.8),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: InkWell(
                      onTap: () {
                        eventBus.fire(ChangeMainPageEvent(3)); //转到客服显示
                        Get.until((ModalRoute.withName(Routes.main)));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          Intr().lxkf,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: ColorX.text0917(),
                            height: 1.8,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3.0,
                            decorationColor: Colors.black, // 设置下划线颜色
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildBankItem(UsdtChannelEntity item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w),
      decoration: BoxDecoration(
        color: ColorX.color_244167,
        borderRadius: BorderRadius.circular(10.r),
      ),
      // width: 240.w,
      padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intr().qianbaodizhi,
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
          ),
          Text(
            item.account.em(),
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Intr().qianbaoleixing,
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                  Text(
                    item.type.em(),
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ],
              ),
              Image.asset(ImageX.other_logo,width: 30.w,fit: BoxFit.fill,),
            ],
          ),
        ],
      ),
    );
  }

}