import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'select_avatar_logic.dart';

///头像选择
class SelectAvatarPage extends StatefulWidget {
  const SelectAvatarPage({Key? key}) : super(key: key);

  @override
  State<SelectAvatarPage> createState() => _SelectAvatarPageState();
}

class _SelectAvatarPageState extends State<SelectAvatarPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<SelectAvatarLogic>();
  final state = Get.find<SelectAvatarLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<SelectAvatarLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("更换头像",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100.h,
            child: GFAvatar(
              backgroundImage: NetworkImage(Constants.test_image),
              shape: GFAvatarShape.circle,
              size: 35.r,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 2.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 10.h),
                    child: GFTabBar(
                      length: 3,
                      controller: _tabController,
                      tabBarHeight: 35.h,
                      tabBarColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.only(top: 28.h,left: 10.w,right: 10.w,bottom: 3.r),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: ColorX.color_091722,
                      ),
                      labelColor: ColorX.color_091722,
                      unselectedLabelColor: ColorX.color_58698d,
                      width: 180.w,
                      tabs: [
                        Text("默认",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                        Text(" QQ ",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                        Text("精选",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 20.w,
                        ),
                        itemCount: 20,
                        itemBuilder: (context,index){
                          return Obx(() {
                            return buildAvatarItem(index,state.selectIndex.value == index);
                          });
                        }),
                  ),
                  SizedBox(height: 20.h,),
                  WidgetUtils().buildElevatedButton("确定", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

                  }),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvatarItem(int index, bool select) {
    return InkWell(
      onTap: ()=> state.selectIndex.value = index,
      child: GFAvatar(
        backgroundImage: NetworkImage(Constants.test_image),
        shape: GFAvatarShape.circle,
        size: 35.r,
        child: Visibility(
          visible: select,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black,width: 2.r),
            ),
          ),
        ),
      ),
    );
  }

}