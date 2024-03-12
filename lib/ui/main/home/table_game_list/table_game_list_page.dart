import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/ds_game_entity.dart';

import 'table_game_list_logic.dart';


///桌游列表
class TableGameListPage extends StatefulWidget {
  const TableGameListPage({Key? key}) : super(key: key);

  @override
  State<TableGameListPage> createState() => _TableGameListPageState();
}

class _TableGameListPageState extends State<TableGameListPage>  with TickerProviderStateMixin{
  final logic = Get.find<TableGameListLogic>();
  final state = Get.find<TableGameListLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 0, vsync: this);

    state.tabLength.listen((length) {
      _tabController.dispose();
      _tabController = TabController(length: length, vsync: this)
        ..addListener(() {
          logic.clickTab(_tabController.index);
        });
    });
    super.initState();
  }



  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<TableGameListLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildRoomBar(state.title,msg: true,drawer: true,
          scaffoldKey:state.scaffoldKey,bgColor: ColorX.appBarBg(),onTap: (){
        // DialogUtils().showGameBrandBtmDialog(context);
        if(unEmpty(state.kindList)){
          DialogUtils().showGameBrandBtmDialog(context,state.kindList!,defKind: state.current).then((value) {
            if(unEmpty(value)){
              state.current = value;
              state.title.value = value!.gameName.em();
              logic.loadGameType(value);
            }
          });
        }
      }),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorX.appBarBg3(),
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  Image.asset(ImageX.icon_search,color: ColorX.icon586(),),
                  Expanded(
                    child: Obx(() {
                      return WidgetUtils().buildTextField(null, 44.h, 16.sp,
                          ColorX.color_949eb9, Intr().qingshuruyouximingcheng,backgroundColor: Colors.transparent,
                          hintColor: ColorX.text586(),
                          defText: state.searchWord.value,inputType:TextInputType.text,onChanged: (v){
                            state.searchWord.value = v;
                            logic.loadByKeyword(v, _tabController.index);
                          });
                    }),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: unEmpty(state.searchWord.value),
                      child: InkWell(
                        onTap: (){
                          state.searchWord.value = "";
                          logic.loadByKeyword("", _tabController.index);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h,),
                          child: Image.asset(ImageX.ic_delete_grey),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              color: ColorX.cardBg(),
              width: 1.sw,
              alignment: Alignment.topLeft,
              child: Obx(() {
                return LCTabBar(
                  length: state.typeList.length,
                  controller: _tabController,
                  tabBarHeight: 60.h,
                  tabAlignment:TabAlignment.start,
                  tabBarColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(top: 40.h,left: 12,right: 12),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.text0917(),
                  ),
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(top: 10),
                  labelColor: ColorX.text0917(),
                  unselectedLabelColor: ColorX.text586(),
                  // width: 0.55.sw,
                  tabs: state.typeList.map((e) =>Container(
                    margin: EdgeInsets.only(bottom: 14,left: 6,right: 6),
                    child:  Text(e.gametype.em(),
                      style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                  ),).toList(),
                );
              }),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,),
                color: ColorX.cardBg2(),
                width: 1.sw,
                child: SingleChildScrollView(
                  child: Obx(() {
                    if(isEmpty(state.list)){return Container();}
                    return Wrap(
                      runSpacing: 10.w,
                      spacing: 5.h,
                      children: state.list.map((element) => buildGameItem(element)).toList(),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGameItem(DsGameGamesZm item) {
    return InkWell(
      onTap: ()=> logic.openGamePage(item),
      child: Container(
        decoration: BoxDecoration(
          color: ColorX.cardBg(),
          borderRadius: BorderRadius.circular(10.r),
        ),
        width: 0.459.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
              child: WidgetUtils().buildImage("${state.allList.imageHost.em()}${item.gamepic.em()}",0.459.sw,0.272.sw,fit: BoxFit.cover,),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Text(item.gamename.em(),
                style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),overflow: TextOverflow.ellipsis),maxLines: 1,),
            ),
            // SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Image.asset(ImageX.icon_hot),
                      SizedBox(width: 3.w,),
                      Text("${item.orderby}",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  InkWell(
                    onTap: ()=> logic.gameFav(item,_tabController.index),
                    child: Padding(
                      padding: EdgeInsets.all(3.r),
                      child: Image.asset(item.favStatus == 1 ? ImageX.icon_heart:ImageX.icon_like),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}