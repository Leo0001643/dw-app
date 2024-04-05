
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class BulletBottomDialog extends StatefulWidget {
  final GameRoomLogic logic;

  final Function valueCallBack;

  BulletBottomDialog(this.logic,this.valueCallBack, {super.key});

  @override
  State<StatefulWidget> createState() => StateBulletBottomDialog();

}

class StateBulletBottomDialog extends State<BulletBottomDialog> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  var tabs = ["changyongduanyu".tr,"qitaduanyu".tr,"biaoqing".tr,"gif".tr];

  var selectPhrases = (-1).obs;


  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  ///用户输入的内容
  var inputList = RxList.empty(growable: true);

  @override
  void initState() {
    loggerArray(["有弹幕数据",widget.logic.state.phrases]);
    if(unEmpty(widget.logic.state.phrases)){
      showList.assignAll(widget.logic.state.phrases[0].phrases ?? []);
    }
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      selectPhrases.value = -1;
      switch(_tabController.index){
        case 0:
          showList.assignAll(widget.logic.state.phrases[0].phrases ?? []);
          showList.refresh();
          break;
        case 1:
          showList.assignAll(widget.logic.state.phrases[1].phrases ?? []);
          showList.refresh();
          break;
        case 2:
          showList.assignAll(widget.logic.state.expressions[1].images ?? []);
          showList.refresh();
          break;
        case 3:
          showList.assignAll(widget.logic.state.expressions[0].images ?? []);
          showList.refresh();
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.54.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorX.pageBg4(),
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorX.cardBg3(),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  margin: EdgeInsets.only(left: 15.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 37.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Obx(() {
                        return Wrap(
                          spacing: 3.w,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: inputList.map((element){
                            if(GetUtils.isURL(element)){
                              return buildInputEmotionItem(element, inputList.indexOf(element));
                            }else {
                              return buildInputCommonItem(element, inputList.indexOf(element));
                            }
                          }).toList(),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: ()=> sendMessage(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                  child: Image.asset(ImageX.icon_send,color: ColorX.icon586(), width: 24.r,height: 24.r,),
                ),
              ),
            ],
          ),
          LCSegmentTabs(
            length: tabs.length,
            tabController: _tabController,
            height: 40.h,
            width: 1.sw,
            border: Border.fromBorderSide(BorderSide(width: 0,color: Colors.transparent)),
            tabBarColor: ColorX.pageBg4(),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.only(top: 34.h,left: 20.w,right: 20.w,bottom: 3.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.text0917(),
            ),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            tabs: tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),).toList(),
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              color: ColorX.cardBg2(),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Obx(() {
                      var padding = _tabController.index == 3 ? EdgeInsets.all(1.r) : EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w);
                      var spacing = _tabController.index == 3 ? 0.0 : 10.r;
                      var alignment = _tabController.index > 1 ? WrapAlignment.spaceAround: WrapAlignment.start;
                      return Container(
                        padding: padding,
                        width: 1.sw,
                        // color: Colors.black,
                        child: Wrap(
                          runSpacing: spacing,
                          spacing: spacing,
                          alignment: alignment,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: showList.map((e){
                            switch(_tabController.index){
                              case 2:
                                return buildEmotionItem(e, showList.indexOf(e),);
                              case 3:
                                return buildGifItem(e, showList.indexOf(e),);
                              default:
                                return buildCommonItem(e,showList.indexOf(e),);
                            }
                          }).toList(),
                        ),
                      );
                    }),
                  ),
                  Positioned(
                    right: 10.w,bottom: 10.h,
                    child: InkWell(
                      onTap: (){
                        if(unEmpty(inputList)){
                          inputList.value = inputList.sublist(0,inputList.length - 1);
                          inputList.refresh();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: ColorX.cardBg(),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset(ImageX.delete,color: ColorX.icon586(),width: 25.w,fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  String buildRoomHeadType() {
    switch(widget.logic.state.roomType.value){
      case 2:
        return ImageX.ic_2room_head;
      case 3:
        return ImageX.ic_3room_head;
      default:
        return ImageX.ic_1room_head;
    }
  }

  Color buildTextColor(){
    var color = ColorX.color_fc243b;
    switch(widget.logic.state.roomType.value){
      case 1:
        color = ColorX.color_fc243b;
        break;
      case 2:
        color = ColorX.color_70b6ff;
        break;
      case 3:
        color = ColorX.color_ffe0ac;
        break;
    }
    return color;
  }


  Widget buildDrawTime(String time) {
    return Container(
      width:24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildCommonItem(String tab,int index,) {
    return InkWell(
      onTap: (){
        selectPhrases.value = index;
        addMessage(tab);
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectPhrases.value == index ? ColorX.color_fc243b : ColorX.cardBg(),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 14.w),
        child: Text(tab,
          style: TextStyle(
            fontSize: 14.sp,
            color: selectPhrases.value == index ? Colors.white : ColorX.text5862(),
          ),),
      ),
    );
  }

  Widget buildEmotionItem(String icon, int index){
    return InkWell(
      onTap: ()=>addMessage(icon),
      child: WidgetUtils().buildImage(icon.trim(),0.085.sw,0.085.sw,fit: BoxFit.cover,),
    );
  }


  Widget buildGifItem(String icon, int index){
    return InkWell(
      onTap: (){///动图点击需要直接发送
        widget.valueCallBack.call(icon);
      },
      child: WidgetUtils().buildImage(icon.trim(),0.24.sw,0.24.sw,fit: BoxFit.cover,defImage: ""),
    );
  }

  Widget buildInputCommonItem(String tab,int index,) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg(),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      child: Text(tab,
        style: TextStyle(
          fontSize: 12.sp,
          color: ColorX.text5862(),
        ),),
    );
  }

  Widget buildInputEmotionItem(String icon, int index){
    return WidgetUtils().buildImage(icon.trim(),20.r,20.r,fit: BoxFit.cover,);
  }

  void addMessage(String tab) {
    var phrasesList = List<String>.empty(growable: true);
    var emotionList = List<String>.empty(growable: true);

    inputList.forEach((element) {
      if(element.toString().isUrl()){
        emotionList.add(element);
      }else {
        phrasesList.add(element);
      }
    });
    ///最大可以添加三条短语和16个表情
    if(phrasesList.length < 3 && emotionList.length < 16){
      inputList.add(tab);
      inputList.refresh();
      ///您输入的内容数量已经超过了最大限制
    } else if(!tab.isUrl() && phrasesList.length >= 3){
      showToast(Intr().yicizhinengfasong3tiao);
    }else {
      showToast(Intr().shuruneirongchaoguozuidaxianzhi);
    }
  }

  void sendMessage() {
    var phrasesList = List<String>.empty(growable: true);
    var emotionList = List<String>.empty(growable: true);

    inputList.forEach((element) {
      if(element.toString().isUrl()){
        emotionList.add(element);
      }else {
        phrasesList.add(element);
      }
    });
    if(phrasesList.isNotEmpty){
      widget.valueCallBack.call(phrasesList);
    }else if(emotionList.isNotEmpty){
      widget.valueCallBack.call(emotionList);
    }
  }

}




