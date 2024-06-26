import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';

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
    _tabController = TabController(length: state.tabs.length, vsync: this)
    ..addListener(() {
      state.selectIndex.value = -1;
      state.tabIndex.value = _tabController.index;
      logic.initAvater();
    });
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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().genghuantouxiang,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100.h,
            child: Obx(() {
              return GFAvatar(
                backgroundImage: WidgetUtils().buildImageProvider(DataUtils.findAvatar(state.currentAvatar.value)),
                shape: GFAvatarShape.circle,
                radius: 27.r,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 2.r),
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg(),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 10.h),
                    child: LCSegmentTabs(
                      length: state.tabs.length,
                      tabController: _tabController,
                      height: 35.h,
                      border: Border.all(color: Colors.transparent),
                      tabBarColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.only(top: 28.h,left: 8.w,right: 8.w,bottom: 2.h),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: ColorX.text0917(),
                      ),
                      labelColor: ColorX.text0917(),
                      unselectedLabelColor: ColorX.text586(),
                      width: 0.55.sw,
                      tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),).toList(),
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      var list = state.tabIndex.value == 0 ? state.defaultList : (state.tabIndex.value == 1 ? state.qqList:state.selectionList);
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 20.w,
                          ),
                          itemCount: list.length,
                          itemBuilder: (context,index){
                            return Obx(() {
                              return buildAvatarItem(index,state.selectIndex.value == index,list[index]);
                            });
                          });
                    }),
                  ),
                  SizedBox(height: 20.h,),
                  WidgetUtils().buildElevatedButton(Intr().confirm, 335.w, 50.h,bg: ColorX.color_fc243b,
                      onPressed: ()=> logic.setAvatar()),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvatarItem(int index, bool select,String item) {
    return InkWell(
      onTap: ()=> state.selectIndex.value = index,
      child: GFAvatar(
        backgroundImage: AssetImage(item),
        shape: GFAvatarShape.circle,
        radius: 17.r,
        child: Visibility(
          visible: select,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorX.textBlack(),width: 3.r),
            ),
          ),
        ),
      ),
    );
  }

}