import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'table_game_list_logic.dart';


///桌游列表
class TableGameListPage extends StatefulWidget {
  const TableGameListPage({Key? key}) : super(key: key);

  @override
  State<TableGameListPage> createState() => _TableGameListPageState();
}

class _TableGameListPageState extends State<TableGameListPage> {
  final logic = Get.find<TableGameListLogic>();
  final state = Get.find<TableGameListLogic>().state;

  @override
  void dispose() {
    Get.delete<TableGameListLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRoomBar(state.title,msg: true,bgColor: ColorX.appBarBg(),onTap: (){
        DialogUtils().showGameBrandBtmDialog(context);
      }),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorX.color_f7f8fb,
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  Image.asset(ImageX.icon_search),
                  Expanded(
                    child: Obx(() {
                      return WidgetUtils().buildTextField(null, 44.h, 16.sp,
                          ColorX.color_949eb9, Intr().qingshuruyouximingcheng,backgroundColor: Colors.transparent,
                          defText: state.searchWord.value,inputType:TextInputType.text,onChanged: (v){
                            state.searchWord.value = v;
                          });
                    }),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: unEmpty(state.searchWord.value),
                      child: InkWell(
                        onTap: ()=> state.searchWord.value = "",
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
            SizedBox(height: 10.h,),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,),
                color: ColorX.color_f7f8fb,
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 10.w,
                    spacing: 5.h,
                    children: [
                      buildGameItem(0),
                      buildGameItem(1),
                      buildGameItem(2),
                      buildGameItem(3),
                      buildGameItem(0),
                      buildGameItem(1),
                      buildGameItem(2),
                      buildGameItem(3),
                      buildGameItem(0),
                      buildGameItem(1),
                      buildGameItem(2),
                      buildGameItem(3),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGameItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 0.459.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
            child: Image.network(Constants.test_image,width: 0.459.sw,height: 0.272.sw,fit: BoxFit.cover,),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text("棋牌小游戏棋牌小游戏棋牌小游戏棋牌小游戏棋牌小游戏",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,overflow: TextOverflow.ellipsis),maxLines: 1,),
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
                    Text("9.9w",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                  ],
                ),
                InkWell(
                  onTap: ()=> showToast(Intr().shoucangla),
                  child: Padding(
                    padding: EdgeInsets.all(3.r),
                    child: Image.asset(ImageX.icon_like),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

}