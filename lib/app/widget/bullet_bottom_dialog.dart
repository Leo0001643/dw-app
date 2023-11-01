
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
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

  var tabs = ["常用短语","其他短语","表情","GIF"];

  var selectPhrases = (-1).obs;

  ///常用短语
  var commonPhrases = ["各位PC小王子、小公主们13... ","早上好呀 ~","中午好","晚上好","老板!精神 !",
    "大! 大! 大!!!","小! 小! 小!!!","单! 单! 单!!!","大单! 开!!!","大双! 开!!!","双! 双! 双!!!","搏一搏单车变摩托 !!! ",
    "大家好,我是福建人!! ","别人赌的是钱,我的赌的是命! ","哎呀,老司机一不小心翻车了!!! "];

  ///其他短语
  var otherPhrases = ["扎心了，老铁!","我觉得我还可以抢救一下。","一首凉凉送给大家...","瘫痪",
    "宝宝心里苦，但宝宝不说。","感觉身体被掏空","贫穷使我清醒。","我是梅西，现在慌的一笔","风需萧兮易水塞，壮士一去兮不复还","这次第，怎一个愁字了得。",
    "博彩致富，了解一下?","在暴富的边缘试探","大吉大利，今晚吃鸡"];

  ///表情
  var emotionExpression = [
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
    "https://mna82j1.ina6n.com/public/images/emoticon/tool/daily001.png",
  ];


  ///GIF
  var gifExpression = [
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg1-min.gif",
    "https://worldimgs.oss-cn-beijing.aliyuncs.com/public/images/gif_emoticon/other/32.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg5-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg9-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg1-min.gif",
    "https://worldimgs.oss-cn-beijing.aliyuncs.com/public/images/gif_emoticon/other/32.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg5-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg9-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg1-min.gif",
    "https://worldimgs.oss-cn-beijing.aliyuncs.com/public/images/gif_emoticon/other/32.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg5-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg9-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg1-min.gif",
    "https://worldimgs.oss-cn-beijing.aliyuncs.com/public/images/gif_emoticon/other/32.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg5-min.gif",
    "http://apipic.djx09yvi.com/public/images/gif_emoticon/zhouxingchi/timg9-min.gif",
  ];

  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  ///用户输入的内容
  var inputList = RxList.empty(growable: true);

  @override
  void initState() {
    showList.assignAll(commonPhrases);
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      selectPhrases.value = -1;
      switch(_tabController.index){
        case 0:
          showList.assignAll(commonPhrases);
          showList.refresh();
          break;
        case 1:
          showList.assignAll(otherPhrases);
          showList.refresh();
          break;
        case 2:
          showList.assignAll(emotionExpression);
          showList.refresh();
          break;
        case 3:
          showList.assignAll(gifExpression);
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
        color: Colors.white,
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
                    color: ColorX.color_f7f8fb,
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
                onTap: ()=> widget.valueCallBack.call(inputList.value),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                  child: Image.asset(ImageX.icon_send,width: 24.r,height: 24.r,),
                ),
              ),
            ],
          ),
          LCTabBar(
            length: tabs.length,
            controller: _tabController,
            tabBarHeight: 40.h,
            tabBarColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.only(top: 34.h,left: 35.w,right: 35.w,bottom: 3.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.color_091722,
            ),
            labelColor: ColorX.color_091722,
            unselectedLabelColor: ColorX.color_58698d,
            tabs: tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),).toList(),
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              color: ColorX.color_f7f8fb,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Obx(() {
                      var padding = _tabController.index == 3 ? EdgeInsets.all(1.r) : EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w);
                      var spacing = _tabController.index == 3 ? 1.r: 10.r;
                      var alignment = _tabController.index > 1 ? WrapAlignment.spaceAround: WrapAlignment.start;
                      return Padding(
                        padding: padding,
                        child: Wrap(
                          runSpacing: spacing,
                          spacing: spacing,
                          alignment: alignment,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset(ImageX.delete,width: 25.w,fit: BoxFit.fill,),
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
    switch(widget.logic.state.roomType){
      case 1:
        return ImageX.ic_2room_head;
      case 2:
        return ImageX.ic_3room_head;
      default:
        return ImageX.ic_1room_head;
    }
  }

  Color buildTextColor(){
    var color = ColorX.color_fc243b;
    switch(widget.logic.state.roomType){
      case 0:
        color = ColorX.color_fc243b;
        break;
      case 1:
        color = ColorX.color_70b6ff;
        break;
      case 2:
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
      onTap: () {
        selectPhrases.value = index;
        inputList.add(tab);
        inputList.refresh();
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectPhrases.value == index ? ColorX.color_fc243b : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 14.w),
        child: Text(tab,
          style: TextStyle(
            fontSize: 14.sp,
            color: selectPhrases.value == index ? Colors.white : ColorX.color_58698d,
          ),),
      ),
    );
  }

  Widget buildEmotionItem(String icon, int index){
    return InkWell(
      onTap: (){
        inputList.add(icon);
        inputList.refresh();
      },
      child: Image.network(icon,width: 0.085.sw,height: 0.085.sw,fit: BoxFit.cover,),
    );
  }


  Widget buildGifItem(String icon, int index){
    return InkWell(
      onTap: (){
        inputList.add(icon);
        inputList.refresh();
      },
      child: Image.network(icon,width: 0.24.sw,height: 0.24.sw,fit: BoxFit.cover,),
    );
  }

  Widget buildInputCommonItem(String tab,int index,) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      child: Text(tab,
        style: TextStyle(
          fontSize: 12.sp,
          color: ColorX.color_58698d,
        ),),
    );
  }

  Widget buildInputEmotionItem(String icon, int index){
    return Image.network(icon,width: 20.r,height: 20.r,fit: BoxFit.cover,);
  }

}




