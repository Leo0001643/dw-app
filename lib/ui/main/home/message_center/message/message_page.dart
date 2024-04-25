import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

import 'message_logic.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with SingleTickerProviderStateMixin {
  final logic = Get.find<MessageLogic>();
  final state = Get.find<MessageLogic>().state;
  // late RefreshController _refreshController;

  @override
  void initState() {
    // _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // _refreshController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
      child: Obx(() {
        return ListView.builder(
          itemCount: state.messageList.length,
          itemBuilder: (context,index){
            return InkWell(
              child: buildMessageItem(state.messageList[index]),
              onTap: ()=> logic.updateMessageStatus(state.messageList[index]),
            );
          },
        );
      }),
    );
  }

  Widget buildMessageItem(MessageItemEntity item) {
    return Container(
      margin: EdgeInsets.only(top: 10.r,left: 10.r,right: 10.r),
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 11.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorX.cardBg(),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(ImageX.icon_msg_list,width: 46.w,height: 46.h,),
              Visibility(
                visible: item.mstatus == 0,
                child: Positioned(
                  top: 3.r, right: 5.r,
                  child: GFBadge(
                    size: 10.r,
                    shape: GFBadgeShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 9.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(item.username.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),),
                    Text(DataUtils.format12Hour(item.addTime.em() * 1000),style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                  ],
                ),
                SizedBox(height: 3.h,),
                Text(item.message.em(),
                  style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              ],
            ),
          ),
          SizedBox(width: 8.w,),
        ],
      ),
    );
  }



}