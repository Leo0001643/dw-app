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
import 'package:leisure_games/ui/bean/chess_info_entity.dart';

import 'chess_game_list_logic.dart';


///棋牌游戏列表
class ChessGameListPage extends StatefulWidget {
  const ChessGameListPage({Key? key}) : super(key: key);

  @override
  State<ChessGameListPage> createState() => _ChessGameListPageState();
}

class _ChessGameListPageState extends State<ChessGameListPage> {
  final logic = Get.find<ChessGameListLogic>();
  final state = Get.find<ChessGameListLogic>().state;



  @override
  void dispose() {
    Get.delete<ChessGameListLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRoomBar(state.title,msg: true,bgColor: ColorX.appBarBg(),onTap: (){
        if(unEmpty(state.kindList)){
          DialogUtils().showGameBrandBtmDialog(context,state.kindList!).then((value) {
            if(unEmpty(value)){
              state.current = value;
              state.title.value = value!.gameName.em();
              logic.loadData(value);
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
                            logic.loadByKeyword(v);
                          });
                    }),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: unEmpty(state.searchWord.value),
                      child: InkWell(
                        onTap: (){
                          state.searchWord.value = "";
                          logic.loadByKeyword("");
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
            SizedBox(height: 10.h,),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w,),
                width: 1.sw,
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Wrap(
                      runSpacing: 10.h,
                      spacing: 12.w,
                      children: state.list.map((e) => buildGameItem(e)).toList(),
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

  Widget buildGameItem(ChessInfoEntity chess) {
    return InkWell(
      onTap: ()=> logic.openGamePage(chess),
      child: Container(
        width: 0.2.sw,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: WidgetUtils().buildImage("${chess.imageHost.em()}${chess.gamepic.em()}",0.2.sw,0.15.sw,fit: BoxFit.fill,),
            ),
            SizedBox(height: 7.h,),
            Text(chess.gamename.em(),
              style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),overflow: TextOverflow.ellipsis),maxLines: 2,),
          ],
        ),
      ),
    );
  }

}