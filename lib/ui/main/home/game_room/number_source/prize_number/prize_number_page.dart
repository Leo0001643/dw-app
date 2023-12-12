import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';
import 'prize_number_logic.dart';

class PrizeNumberPage extends StatefulWidget {
  const PrizeNumberPage({Key? key}) : super(key: key);

  @override
  State<PrizeNumberPage> createState() => _PrizeNumberPageState();
}

class _PrizeNumberPageState extends State<PrizeNumberPage> with AutomaticKeepAliveClientMixin{
  final logic = Get.find<PrizeNumberLogic>();
  final state = Get.find<PrizeNumberLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  if(isEmpty(state.data)){ return Container(); }
                  var item = state.data.first;
                  return Text(Intr().juelidixqi(["${item.term.em() + 1}"]),
                    style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),fontWeight: FontWeight.w600,),);
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Intr().daojishi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),fontWeight: FontWeight.w600,),),
                    SizedBox(width: 5.w,),
                    buildDrawTime("00"),
                    Text(" : ",style: TextStyle(fontSize: 18.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
                    buildDrawTime("02"),
                    Text(" : ",style: TextStyle(fontSize: 18.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
                    buildDrawTime("53"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w,right: 15.w,),
            child: Obx(() {
              if(isEmpty(state.data)){ return Container(); }
              var childs = List<Widget>.empty(growable: true);
              var item = state.data.first;
              var splits = item.originalNum.em().split("");
              splits.forEach((element) {
                childs.add(buildDrawNum(element,ColorX.color_70b6ff));
                childs.add(SizedBox(width: 5.w,));
              });
              childs.add(buildDrawNum(item.luckyNum.em(),DataUtils.getBallBgColor(int.parse(item.luckyNum.em()))));
              return Row(children: childs,);
            }),
          ),
          Container(
            color: ColorX.pageBg2(),
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 30,
                  child: Text(Intr().qihao,
                    style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().kaijianghaoma,
                      style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                  ),
                ),
                Expanded(
                  flex: 45,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(Intr().haoyuanjinqi,
                      style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context,index){
                  return buildNumberItem(index,state.data[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }


  Widget buildDrawTime(String time) {
    return Container(
      width:26.r,height: 26.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.cardBg(),
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawNum(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildNumberItem(int index,BtcSourceEntity item) {
    var result = index%2 == 1;
    return InkWell(
      onTap: (){
        DialogUtils().showUnbrokenNumberBtmDialog(context,item);
      },
      child: Container(
        color: result ? ColorX.cardBg2():ColorX.cardBg(),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              flex: 30,
              child: Text("${item.term.em()}",
                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            ),
            Expanded(
              flex: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(item.originalNumStr(),
                    style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(), fontWeight: FontWeight.w600,),),
                  SizedBox(width: 5.w,),
                  buildDrawNum(item.luckyNum.em(), DataUtils.getBallBgColor(int.parse(item.luckyNum.em()))),
                ],
              ),
            ),
            Expanded(
              flex: 45,
              child: Row(
                children: [
                  Expanded(
                    child: Text(item.btcHash.em(),
                      style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7,fontWeight: FontWeight.w600,),
                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}