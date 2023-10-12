

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';

class GameMenuView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => StateGameMenuView();

}

class StateGameMenuView extends State<GameMenuView>{

  buildGroupTitle(String groupByValue) {
    return Text(groupByValue,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp),);
  }

  buildGroupItem(HomeGameMenuEntity element) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: Stack(
            children: [
              Image.network(Constants.test_image,width: 72.r,height: 72.r,fit: BoxFit.cover,),
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
              Positioned(
                right: 0, left: 0, bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 5.r,horizontal: 10.r),
                  child: Text("00:00:33",style: TextStyle(fontSize: 12.sp,color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),
        Text(
          element.name.em(),
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black54,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }


  Widget buildLeftMenu(String e,int index,bool select) {
    return InkWell(
      onTap: (){
        selectMenu.value = index;
        scroll2Item(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: select ? Colors.transparent:ColorX.color_f7f8fb,
          border: select ? Border.all(color: ColorX.color_fc243b,width: 1.w): Border.all(color: Colors.transparent,width: 0),
        ),
        alignment: Alignment.center,
        width: 70.w,
        height: 40.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Text(e,style: TextStyle(fontSize: 12.sp,color: select ? ColorX.color_fc243b:ColorX.color_091722),),
      ),
    );
  }

  var titles = ["PC房间","彩票","真人","体育","捕鱼","电子"];

  var selectMenu = 0.obs;

  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Container(
            width: 90.w,
            margin: EdgeInsets.only(left: 10.w),
            child: Obx(() {
              return Column(
                children: titles.map((e){
                  return buildLeftMenu(e,titles.indexOf(e),titles.indexOf(e) == selectMenu.value);
                }).toList(),
              );
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildCategoryItem(),
              ),
            ),
          ),
          SizedBox(width: 20.w,),
        ],
      ),
    );
  }


  @override
  void initState() {
    scrollController.addListener(() {
      logger("滚动位置${scrollController.offset}");
      if(scrollController.offset > 0){
        var index = scrollController.offset ~/ 240.h;
        if(index != selectMenu.value){
          selectMenu.value = index;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scroll2Item(int index) {
    scrollController.jumpTo(index * 240.h);
  }

  List<Widget> buildCategoryItem() {
    var list = List<Widget>.empty(growable: true);
    titles.forEach((element) {
      list.addAll([
        buildGroupTitle(element),
        SizedBox(height: 10.h,),
        Wrap(
          spacing: 18.w,
          runSpacing: 10.h,
          children: [
            InkWell(
              onTap: ()=> Get.toNamed(Routes.room_list),
              child: buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
            ),
            buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
            buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
            buildGroupItem(HomeGameMenuEntity(name:"Joke",group: element)),
          ],
        ),
        SizedBox(height: 10.h,),
      ]);
    });
    return list;
  }


}


