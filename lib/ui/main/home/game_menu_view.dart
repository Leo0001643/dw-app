

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

class GameMenuView extends StatefulWidget{

  final HomeLogic logic;

  GameMenuView(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateGameMenuView();

}

class StateGameMenuView extends State<GameMenuView>{


  var selectMenu = 0.obs;

  var scrollController = ScrollController();

  var itemHeightMap = <int,double>{};

  @override
  void initState() {
    scrollController.addListener(() {
      // loggerArray(["滚动位置",scrollController.offset]);
      if(scrollController.offset < ((itemHeightMap[0] ?? 0))){
        selectMenu.value = 0;
      }else if (scrollController.offset == scrollController.position.maxScrollExtent) {
        selectMenu.value = itemHeightMap.length - 1;
      } else {
        itemHeightMap.forEach((key, value) {
          if(scrollController.offset > value && scrollController.offset < (itemHeightMap[key + 1] ?? 0) ){
            // loggerArray(["滚动位置",scrollController.offset,((itemHeightMap[0] ?? 0) + 50.h),scrollController.position.maxScrollExtent]);
            selectMenu.value = key + 1;
          }
        });
      }
    });
    widget.logic.state.menuGroup.listen((v) {
      var data = <int,double>{};
      for (var element in v) {
        var height = measureItem(element);
        var index = v.indexOf(element);
        data[index] = height + (data[index - 1] ?? 0);
      }
      itemHeightMap.assignAll(data);
      loggerArray(["数据吞吐量",itemHeightMap]);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scroll2Item(int index) {
    if(index == itemHeightMap.length - 1){
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }else {
      scrollController.jumpTo(itemHeightMap[index - 1] ?? 0);
    }
  }

  double measureItem(GameKindEntity element){
    var cl = element.gameKindList.em();
    var typeHeight = 30.h;
    if(cl > 0){
      var plus = (cl % 3) == 0 ? 0 : 1;
      typeHeight = (cl ~/ 3 + plus) * 100.h + typeHeight;
    }
    return typeHeight;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Container(
            width: 90.w,
            margin: EdgeInsets.only(left: 10.w),
            child: Obx(() {
              var menuGroup = widget.logic.state.menuGroup;
              return Column(
                children: menuGroup.map((e){
                  return buildLeftMenu(e,menuGroup.indexOf(e),menuGroup.indexOf(e) == selectMenu.value);
                }).toList(),
              );
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Obx(() {
                var menuGroup = widget.logic.state.menuGroup;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: menuGroup.map((element) => buildCategoryItem(element)).toList(),
                );
              }),
            ),
          ),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }


  Column buildCategoryItem(GameKindEntity element) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildGroupTitle(element),
        SizedBox(height: 10.h,),
        Wrap(
          spacing: 15.w,
          runSpacing: 10.h,
          children: element.gameKindList?.map((e){
            return InkWell(
              onTap: ()=> jumpGameRoom(e),
              child: buildGroupItem(e),
            );
          }).toList() ?? [],
          // children: [
          //   InkWell(
          //     onTap: ()=> Get.toNamed(Routes.room_list),
          //     child: buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
          //   ),
          //   InkWell(
          //     onTap: ()=> Get.toNamed(Routes.chess_game_list),
          //     child: buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
          //   ),
          //   InkWell(
          //     onTap: ()=> Get.toNamed(Routes.table_game_list),
          //     child: buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
          //   ),
          //   buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
          // ],
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }


  buildGroupTitle(GameKindEntity element) {
    return Text(element.gameKindName.em(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: ColorX.textBlack()),);
  }

  buildGroupItem(GameKindGameKindList element) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: Stack(
            children: [
              Image.network(element.image(),width: 72.r,height: 72.r,fit: BoxFit.cover,),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  margin: EdgeInsets.all(3.r),
                  child: Image.asset(ImageX.icon_heart,/*color: Colors.white,*/),
                ),
              ),
              Visibility(
                visible: element.gameKind == Constants.PC28,
                child: Positioned(
                  right: 0, left: 0, bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 5.r,horizontal: 10.r),
                    child: Text("00:00:33",style: TextStyle(fontSize: 10.sp,color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),
        SizedBox(
          width: 72.r,
          child: Text(
            element.gameName.em(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black54,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }


  Widget buildLeftMenu(GameKindEntity e,int index,bool select) {
    return InkWell(
      onTap: (){
        selectMenu.value = index;
        scroll2Item(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: select ? Colors.transparent:ColorX.cardBg(),
          border: select ? Border.all(color: ColorX.color_fc243b,width: 1.w): Border.all(color: Colors.transparent,width: 0),
        ),
        alignment: Alignment.center,
        width: 70.w,
        height: 40.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Text(e.gameKindName.em(),style: TextStyle(fontSize: 12.sp,color: select ? ColorX.color_fc243b:ColorX.text0917()),),
      ),
    );
  }


  void jumpGameRoom(GameKindGameKindList element) {
    switch(element.gameKind){
      case Constants.PC28:
        Get.toNamed(Routes.room_list,arguments: element);
        break;
      default:
        if(AppData.isLogin()){

        }else {
          Get.toNamed(Routes.login);
        }
        break;
    }
  }
}


