import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'notice_logic.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final logic = Get.find<NoticeLogic>();
  final state = Get.find<NoticeLogic>().state;
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: ()=> _refreshController.refreshCompleted(),
        onLoading: ()=> _refreshController.loadComplete(),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            var item = MessageItemEntity(id: 11217,noteContent: "欢迎来到国际站，期待与您携手并进，再创佳绩",
                noteTitle: "欢迎光临",addTime: 1639991272,noteType: 2);
            return InkWell(
              child: buildNoticeItem(item),
              onTap: (){
                Get.toNamed(Routes.message_details,arguments: item);
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildNoticeItem(MessageItemEntity item) {
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
                child: GFBadge(
                  size: 10.r,
                  shape: GFBadgeShape.circle,
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
                      child: Text("欢迎光临",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ),
                    Text("7分钟前",style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                  ],
                ),
                SizedBox(height: 3.h,),
                Text("欢迎来到国际站,期待与您携手并进,再创佳绩!…",
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