

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
import 'package:leisure_games/app/utils/widget_utils.dart';
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

  ScrollController? scrollController;

  var itemHeightMap = <int,double>{};

  @override
  void initState() {
    initScrollListener();
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant GameMenuView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   initScrollListener();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initScrollListener();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    scrollController = null;
    super.dispose();
  }

  void scroll2Item(int index) {
    if(index == itemHeightMap.length - 1){
      scrollController?.jumpTo(scrollController?.position.maxScrollExtent ?? 0);
    }else {
      scrollController?.jumpTo(itemHeightMap[index - 1] ?? 0);
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
            child: Obx(() {
              var menuGroup = widget.logic.state.menuGroup;
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: menuGroup.map((element) => buildCategoryItem(element)).toList(),
                ),
              );
            }),
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
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }


  buildGroupTitle(GameKindEntity element) {
    return Row(
      children: [
        WidgetUtils().buildImage(findImage(element), 20.r, 20.r,),
        SizedBox(width: 3.w,),
        Text(element.gameKindName.em(),
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: ColorX.textBlack()),),
      ],
    );
  }

  buildGroupItem(GameKindGameKindList element) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: Stack(
            children: [
              Image.network(element.image(),width: 68.r,height: 68.r,fit: BoxFit.cover,),
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
          color: select ? Colors.transparent:ColorX.cardBg3(),
          image: select ? DecorationImage(image: WidgetUtils().buildImageProvider(ImageX.isSelectT()),fit: BoxFit.fill) : null,
          // border: select ? Border.all(color: ColorX.color_fc243b,width: 1.w): Border.all(color: Colors.transparent,width: 0),
        ),
        alignment: Alignment.center,
        width: 75.w,
        height: 34.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils().buildImage(findImage(e), 20.r, 20.r,),
            SizedBox(width: 3.w,),
            Text(e.gameKindName.em(),
              style: TextStyle(fontSize: 12.sp,color: select ? Colors.white:ColorX.text0917()),),
          ],
        ),
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

  String findImage(GameKindEntity e) {
    switch(e.gameKind){
      case "lottery":
        return ImageX.ic_caipiao;
      case "live":
        return ImageX.ic_zhenren;
      case "chess":
        return ImageX.ic_qipai;
      case "sport":
        return ImageX.ic_tiyu;
      case "game_fishing":
        return ImageX.ic_boyu;
      case "game":
        return ImageX.ic_dianzi;
      default:
        return ImageX.fire;
    }
  }

  void initScrollListener() {
    if(itemHeightMap.isEmpty){
      widget.logic.state.menuGroup.listen((v) {
        intItemHeight(v);
      });
      intItemHeight(widget.logic.state.menuGroup);
    }
    if(scrollController == null){
      scrollController = ScrollController();
      scrollController?.addListener(() {
        if(scrollController!.offset < ((itemHeightMap[0] ?? 0))){
          selectMenu.value = 0;
        }else if (scrollController?.offset == scrollController?.position.maxScrollExtent) {
          selectMenu.value = itemHeightMap.length - 1;
        } else {
          itemHeightMap.forEach((key, value) {
            if(scrollController!.offset > value && scrollController!.offset < (itemHeightMap[key + 1] ?? 0) ){
              // loggerArray(["滚动位置",scrollController.offset,((itemHeightMap[0] ?? 0) + 50.h),scrollController.position.maxScrollExtent]);
              selectMenu.value = key + 1;
            }
          });
        }
        // loggerArray(["滚动位置",selectMenu.value,itemHeightMap.length,scrollController?.offset]);
      });
      // loggerArray(["滚动位置",selectMenu.value,itemHeightMap.length,widget.logic.state.menuGroup.length,]);
    }

  }

  void intItemHeight(List<GameKindEntity> v) {
    var data = <int,double>{};
    for (var element in v) {
      var height = measureItem(element);
      var index = v.indexOf(element);
      data[index] = height + (data[index - 1] ?? 0);
    }
    itemHeightMap.assignAll(data);
    loggerArray(["数据吞吐量",itemHeightMap]);
  }


}


