import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

import 'withdraw_channel_logic.dart';

///提醒渠道选择
class WithdrawChannelPage extends StatefulWidget {
  @override
  State<WithdrawChannelPage> createState() => _WithdrawChannelPageState();
}

class _WithdrawChannelPageState extends State<WithdrawChannelPage> {
  final logic = Get.find<WithdrawChannelLogic>();
  final state = Get.find<WithdrawChannelLogic>().state;

  @override
  void dispose() {
    Get.delete<WithdrawChannelLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      backgroundColor: ColorX.pageBg2(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
            ),
            height: 226.h,
          ),
          Column(
            children: [
              WidgetUtils().buildAppBar(Intr().tixianfangshi,bgColor: Colors.transparent,systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    var list = List.empty(growable: true);
                    if(unEmpty(state.userDraw.value.banks)){
                      list.add(state.userDraw.value.banks.first);
                    }
                    state.userDraw.value.dcBanks.forEach((element) {
                      ///筛选出第三方钱包
                      if(element.type?.startsWith('USDT') == false && element.status == 1){
                        list.add(element);
                      }
                    });

                    return Column(
                      children: [
                        ...list.map((e) => buildCategoryItem(e)).toList()
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildCategoryItem(Object item) {
    var bankName = "";
    var icon = ImageX.icOtherT();
    if(item is UserDrawDetailBanks){
      bankName = Intr().yhk;
      icon = ImageX.iconYhkzzT();
    }else if(item is UsdtEntity){
      bankName = Intr().xqianbao_([item.type.em()]);
      icon = ImageX.icOtherT();
    }
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorX.cardBg(),
      ),
      child: InkWell(
        onTap: () => logic.jumpPage(context,item),
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              WidgetUtils().buildImage(icon, 18.r, 18.r,),
              SizedBox(
                width: 8.w,
              ),
              Text(
                bankName,
                style: TextStyle(fontSize: 14.sp, color: ColorX.textBlack(),fontWeight: FontWeight.w600),
              ),
              Expanded(child: Container()),
              Image.asset(
                ImageX.ic_into_right,
                color: ColorX.icon586(),
                width: 15.r,
                height: 15.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

}