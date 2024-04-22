import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'preferential_detail_logic.dart';

class PreferentialDetailPage extends StatefulWidget {
  const PreferentialDetailPage({Key? key}) : super(key: key);

  @override
  State<PreferentialDetailPage> createState() => _PreferentialDetailPageState();
}

class _PreferentialDetailPageState extends State<PreferentialDetailPage> {
  final logic = Get.find<PreferentialDetailLogic>();
  final state = Get.find<PreferentialDetailLogic>().state;


  @override
  void initState() {
    state.detail = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<PreferentialDetailLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().xiangqing,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.cardBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network("${state.detail.url.em()}${state.detail.picurl.em()}",fit: BoxFit.fill,
                height: 163.h,width: 335.w,),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(state.detail.title.em(),
                style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(state.detail.titleSec.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698D,),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: HtmlWidget(
                state.detail.content.em(),
                textStyle: TextStyle(color: ColorX.color_333333),
                customStylesBuilder: (element){
                  // loggerArray(['打印看一下构建参数',element.localName,element.styles.map((e) => "${e.property}=${e.value?.toString()}").toList()]);
                  switch (element.localName) {
                  // case "table":
                  //   return {'width': '100%'};
                    case "td":
                      return {'border': '1pt solid windowtext;'};
                  // case "p":
                  //   return {};
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}