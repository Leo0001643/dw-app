
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/version_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  with SingleTickerProviderStateMixin{
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;

  @override
  void initState() {
    logic.checkPermission(context);
    state.tabController = TabController(length: state.pages.length,vsync: this);
    VersionUtils().checkVersion(context,false);
    super.initState();
  }


  @override
  void dispose() {
    Get.delete<MainLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: state.pageController,
        children: state.pages,
      ),
      bottomNavigationBar: GetBuilder<GetMaterialController>(
        builder: (ct){
          return ConvexAppBar.builder(
              height: 49.h,
              elevation: 1.h,
              controller: state.tabController,
              backgroundColor: ColorX.appBarBg(),
              curveSize: 58.r,
              itemBuilder: ItemBuilder(),
              onTap: jumpToPage,
              count: 5);
        },
      ),
    );
  }

  void jumpToPage(int i) {
    if(AppData.isLogin() || (i != 2 && i != 4)){
      state.pageController.jumpToPage(i);
    } else {
      WidgetUtils().goLogin();
      //切换到首页
      state.pageController.jumpToPage(0);
      state.tabController?.index = 0;
    }
  }

}

class ItemBuilder extends DelegateBuilder{

  @override
  Widget build(BuildContext context, int index, bool active) {
    switch(index){
      case 0:
        return buildNormalLabel("home_home".tr,ImageX.iconHomeT(),ImageX.icon_home,24.r,active);
      case 1:
        return buildNormalLabel("home_discount".tr,ImageX.iconYouhuiT(),ImageX.icon_youhui,24.r,active);
      case 2:
        return buildNormalLabel("home_recharge".tr,ImageX.iconChargeCoinT(),ImageX.icon_charge_coin,48.r,active,index:2);
      case 3:
        return buildNormalLabel("home_kefu".tr,ImageX.iconCustomerT(),ImageX.svg_service_sel,24.r,active);
      case 4:
        return buildNormalLabel("home_mine".tr,ImageX.myT(),ImageX.icon_mine,24.r,active);
      default :
        return Container();
    }

  }

  @override
  bool fixed() {
    return true;
  }

  Widget buildNormalLabel(String label, String icon,String activeicon,double iconsize, bool active,{int index=0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetUtils().buildImage(active ? activeicon: icon,iconsize,iconsize,),
        Visibility(
            visible: index==2,
            child: SizedBox(height: 5.h,)),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: active?ColorX.color_fc243b:ColorX.color_5b6d7b,
          ),
        ),
      ],
    );
  }

}




