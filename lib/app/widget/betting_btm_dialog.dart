
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class BettingBtmDialog extends StatefulWidget {
  final GameRoomLogic logic;
  BettingBtmDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateBettingBtmDialog();

}

class StateBettingBtmDialog extends State<BettingBtmDialog> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  var chips = [ImageX.chip1,ImageX.chip5,ImageX.chip10,ImageX.chip50,ImageX.chip100,ImageX.chip500,ImageX.chip1000,
    ImageX.chip5000,ImageX.chip10000,];

  var chipIndex = (-1).obs;

  var inputAmt = "".obs;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
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
      height: 0.77.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorX.pageBg4(),
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w,top: 15.h),
                child: InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Image.asset(ImageX.icon_down_arrow,color: ColorX.iconBlack(),),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().touzhu,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),),),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorX.cardBg(),width: 1.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 95.h,
              width: 345.w,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(buildRoomHeadType()),fit: BoxFit.fill),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().dixqi(["1231312"]),style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            buildDrawTime("00"),
                            Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                            buildDrawTime("02"),
                            Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                            buildDrawTime("53"),
                            SizedBox(width: 5.w,),
                            Text(Intr().end,style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  LCSegmentTabs(
                    length: tabs.length,
                    tabController: _tabController,
                    height: 40.h,
                    width: 340.w,
                    border: Border.all(color: Colors.transparent),
                    tabBarColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.only(top: 33.h,left: 10.w,right: 10.w,bottom: 3.r),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: buildTextColor(),
                    ),
                    labelColor: buildTextColor(),
                    unselectedLabelColor: ColorX.text0917(),
                    tabs: tabs.map((e) =>
                        Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 6.w,
                  spacing: 6.h,
                  children: [
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildSizeCard(""),
                    buildWaveCard(""),
                    buildWaveCard(""),
                    buildWaveCard(""),
                    buildWaveCard(""),
                    buildWaveCard(""),
                    buildWaveCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                    buildNumCard(""),
                  ],
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        GFCard(
                          height: 138.h,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          color: ColorX.cardBg4(),
                          elevation: 3.r,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,left: 0,right: 0,
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 70.h,
                                  alignment: Alignment.bottomLeft,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Obx(() {
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: chips.map((e) {
                                          var index = chips.indexOf(e);
                                          var btm = chipIndex.value == index ? 20.h:0.0;
                                          var top = chipIndex.value == index ? 0.0:20.h;
                                          return buildChipItem(e,index,top,btm);
                                        }).toList(),
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: ColorX.color_091722,width: 1.r),
                                          borderRadius: BorderRadius.circular(10.r)
                                      ),
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Obx(() {
                                        return WidgetUtils().buildTextField(101.w, 40.h, 15.sp, ColorX.color_949eb9, Intr().qingshurujine,
                                            backgroundColor: ColorX.cardBg(),hintColor: ColorX.text586(),
                                            defText: inputAmt.value,inputType: TextInputType.number,onChanged: (v)=> inputAmt.value = v);
                                      }),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(Intr().zongji,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),),
                                          Text("¥ 35000000",style: TextStyle(fontSize: 14.sp,color: buildTextColor(),),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    InkWell(
                                      onTap: (){
                                        inputAmt.value = "";
                                        chipIndex.value = -1;
                                      },
                                      child: Image.asset(ImageX.icon_clear,width: 48.w,height: 40.h,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30.h),
                            alignment: Alignment.center,
                            width: 90.w,
                            child: WidgetUtils().buildElevatedButton(Intr().touzhu, 62.w, 88.h, textSize:16.sp, bg: buildTextColor(), onPressed: (){
                              ///确认投注
                              // DialogUtils().showConfirmBetDialog(context, widget.logic);
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildSizeCard(String item) {
    return SizedBox(
      width: 64.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 64.w,
          height: 63.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 6.h,),
              Text("大",style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
              SizedBox(height: 15.h,),
              Text("4.2",style: TextStyle(fontSize: 13.sp,color: ColorX.textd53()),),
              SizedBox(height: 6.h,),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildWaveCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Text("大",style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
              SizedBox(height: 15.h,),
              Text("4.2",style: TextStyle(fontSize: 13.sp,color: ColorX.textd53()),),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Container(
                alignment: Alignment.center,
                width: 28.r,height: 28.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: ColorX.color_e7ebf4,width: 1.r),
                ),
                child: Text("04",style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7),),
              ),
              SizedBox(height: 3.h,),
              Text("4.2",style: TextStyle(fontSize: 13.sp,color: ColorX.textd53()),),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChipItem(String icon,int index,double top,double btm) {
    return InkWell(
      onTap: ()=> chipIndex.value = index,
      child: Container(
        margin: EdgeInsets.only(left: 5.w,right: 5.w,top: top,bottom: btm),
        child: Image.asset(icon,width: 45.r,height: 45.r,fit: BoxFit.fill,),
      ),
    );
  }

}




