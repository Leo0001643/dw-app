import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';

import 'notice_logic.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final logic = Get.find<NoticeLogic>();
  final state = Get.find<NoticeLogic>().state;
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
          itemCount: state.noticeList.length,
          itemBuilder: (context,index){
            return InkWell(
              child: buildNoticeItem(state.noticeList[index]),
              onTap: (){
                Get.toNamed(Routes.message_details,arguments: state.noticeList[index]);
              },
            );
          },
        );
      }),
    );
  }

  Widget buildNoticeItem(NoticeEntity item) {
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
              Image.asset(ImageX.icon_msg,width: 46.w,height: 46.h,),
              Positioned(
                top: 3.r, right: 5.r,
                child: Visibility(
                  visible: false,
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
                    Expanded(
                      child: Text(item.noteTitle.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ),
                    Text(DataUtils.format12Hour(item.addTime.em() * 1000),style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                  ],
                ),
                SizedBox(height: 3.h,),
                Text(item.noteContent.em(),
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