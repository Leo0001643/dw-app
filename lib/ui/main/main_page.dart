
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/main/ends_drawer_view.dart';
import '/app/intl/intr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: state.scaffoldKey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: state.pageController,
        children: state.pages,
      ),
      endDrawer: EndsDrawerView(),
      bottomNavigationBar: ConvexAppBar.builder(
          height: 49.h,
          elevation: 1.h,
          backgroundColor: Colors.white,
          curveSize: 58.r,
          itemBuilder: ItemBuilder(),
          onTap: (i)=> state.pageController.jumpToPage(i),
          count: 5)
    );
  }



  @override
  void dispose() {
    Get.delete<MainLogic>();
    super.dispose();
  }


}

class ItemBuilder extends DelegateBuilder{

  @override
  Widget build(BuildContext context, int index, bool active) {
    switch(index){
      case 0:
        return buildNormalLabel(Intr().home,ImageX.icon_home1,ImageX.icon_home,24.r,active);
      case 1:
        return buildNormalLabel(Intr().preferential,ImageX.icon_youhui1,ImageX.icon_youhui,24.r,active);
      case 2:
        return buildNormalLabel(Intr().charge,ImageX.icon_charge_coin,ImageX.icon_charge_coin,48.r,active);
      case 3:
        return buildNormalLabel(Intr().customer_service,ImageX.icon_custome_1,ImageX.icon_customer,24.r,active);
      case 4:
        return buildNormalLabel(Intr().mine,ImageX.icon_mine1,ImageX.icon_mine,24.r,active);
      default :
        return Container();
    }

  }

  @override
  bool fixed() {
    return true;
  }

  Widget buildNormalLabel(String label, String icon,String activeicon,double iconsize, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(active ? activeicon: icon,width: iconsize,height: iconsize,),
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




