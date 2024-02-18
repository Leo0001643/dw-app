import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_category_logic.dart';

///
///充值页面 适配各种类型的充值
class RechargeCategoryPage extends StatefulWidget {
  const RechargeCategoryPage({Key? key}) : super(key: key);

  @override
  State<RechargeCategoryPage> createState() => _RechargeCategoryPageState();
}

class _RechargeCategoryPageState extends State<RechargeCategoryPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<RechargeCategoryLogic>();
  final state = Get.find<RechargeCategoryLogic>().state;

  @override
  void initState() {
    //判断是否支持在线 不支持默认页面显示离线
    state.pageController = PageController(initialPage: state.supportOnline.value ? 0:1);
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.tabController.addListener(() {
      state.pageController.jumpToPage(state.tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    state.tabController.dispose();
    state.pageController.dispose();
    Get.delete<RechargeCategoryLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              WidgetUtils().buildRoomBar(state.title,msg: true,bgColor: Colors.transparent,onTap: (){
                if(unEmpty(state.paymentList.value)){
                  DialogUtils().showSelectPaywayBtmDialog(context,state.paymentList.value).then((value) {
                    if(unEmpty(value)){ jumpPage(value!); }
                  });
                }
              }),
              Obx(() {
                return Visibility(
                  visible: state.supportOnline.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    child: LCTabBar(
                      length: state.tabs.length,
                      controller: state.tabController,
                      tabBarHeight: 35.h,
                      tabBarColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.only(top: 31.h,left: 30.w,right: 30.w,bottom: 1.h),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: ColorX.text0917(),
                      ),
                      labelColor: ColorX.text0917(),
                      unselectedLabelColor: ColorX.text586(),
                      width: 335.w,
                      tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),).toList(),
                    ),
                  ),
                );
              }),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: state.pageController,
                  children: state.pages,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  void jumpPage(PaymentListBanks value) {
    if(value.id == state.paymentInfo.id){
      ///打开自己，不做任何操作
    } else {///打开其他类型的选项
      switch(value.bankCode){
        case Constants.code_usdt:
          Get.offAndToNamed(Routes.recharge_digital,arguments: value);
          break;
        case Constants.code_wangyin:
        case Constants.code_zhifubao:
        case Constants.code_weixin:
        case Constants.code_ysfzf:
        case Constants.code_qmf:
        case Constants.code_caifutong:
        logic.loadData(value);
        break;
        default:
          Get.offAndToNamed(Routes.recharge_wallet, arguments: value);
          break;
      }
    }
  }

}