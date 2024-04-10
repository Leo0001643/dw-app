import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'withdraw_logic.dart';

///
///提现中心
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final logic = Get.find<WithdrawLogic>();
  final state = Get.find<WithdrawLogic>().state;

  ///需要根据有无绑定账户跳转相应处理页面
  void clickItem(BuildContext context, int i) {
    var msg = "";
    var route = "";
    //  if(i == 1 && isEmpty(state.userDraw.value.banks)){
    //       msg = Intr().ninhaimeibangdingyhkzhanghu;
    //       route = Routes.bind_bank;
    //     }else
    if(i == 5 && state.userDraw.value.dcBanks.where((element) => unEmpty(element.account)).toList().isEmpty){
      msg = Intr().ninhaimeibangdingusdtzhanghu;
      route = Routes.bind_usdt;
    }
    if(unEmpty(msg)){
      DialogUtils().showMessageDialog(context, msg,btnConfirm: Intr().qubangding, onConfirm: ()=> Get.offAndToNamed(route));
    } else {
      if(i == 1){
        Get.toNamed(Routes.withdraw_channel,arguments: i.toString());
      }else {
        Get.toNamed(Routes.withdraw_check,arguments: i.toString());
      }
    }
  }
  
  @override
  void dispose() {
    Get.delete<WithdrawLogic>();
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
              WidgetUtils().buildAppBar(Intr().tixianzhongxin,bgColor: Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
              Container(
                height: 140.h,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFAvatar(
                      backgroundImage: WidgetUtils().buildImageProvider(DataUtils.findAvatar(AppData.user()?.avatar)),
                      radius: 20.r,
                    ),
                    SizedBox(height: 7.h,),
                    Text(Intr().tixianzhanghu_([AppData.user()?.username ?? ""]),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                  ],
                ),
              ),
              buildCategoryItem(Intr().congcnyqianbaotichu, ImageX.iconJjGrey(), 1),
              buildCategoryItem(Intr().congusdtqianbaotichu, ImageX.usdtT(), 5),
            ],
          ),
        ],
      )
    );
  }


  Widget buildCategoryItem(String title, String icon, int i) {
    return InkWell(
      onTap: ()=> clickItem(context,i),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorX.cardBg(),
        ),
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
        padding: EdgeInsets.all(15.r),
        child: Row(
          children: [
            WidgetUtils().buildImage(icon, 18.r, 18.r),
            SizedBox(width: 5.w,),
            Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
            Expanded(child: Container()),
            Image.asset(ImageX.icon_right_grey,color: ColorX.icon586(),),
          ],
        ),
      ),
    );
  }

}