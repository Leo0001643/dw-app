
import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/area_index_bean.dart';

class SelectAreaBtmDialog extends StatefulWidget{

  final Map<String, List<String>> data;
  const SelectAreaBtmDialog(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectAreaBtmDialog();

}

class StateSelectAreaBtmDialog extends State<SelectAreaBtmDialog>{

  var data = List<AreaIndexBean>.empty(growable: true);

  @override
  void initState() {
    widget.data.forEach((key, value) {
      value.forEach((element) {
        data.add(AreaIndexBean(key,element));
      });
    });
    SuspensionUtil.setShowSuspensionStatus(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.75.sh,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
        child: Column(
          children: [
            Expanded(
              child: AzListView(
                data: data,
                itemCount: data.length,
                itemBuilder: (context,index){
                  var item = data[index];
                  return Column(
                    children: [
                      Offstage(
                        offstage: item.isShowSuspension != true,
                        child: Container(
                          color: ColorX.appBarBg2(),
                          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                          width: 1.sw,
                          child: Text(item.tabIndex,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                        ),
                      ),
                      InkWell(
                        onTap: ()=> Navigator.pop(context,item.name.em().substring(item.name.em().lastIndexOf("+"))),
                        child: Container(
                          color: ColorX.cardBg5(),
                          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                          width: 1.sw,
                          child: Text(item.name.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                        ),
                      ),
                    ],
                  );
                },
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Container(height: 5.h,width: 1.sw,color: ColorX.color_10_949,),
            InkWell(
              onTap: ()=> Navigator.pop(context,null),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                child: Text(Intr().cancel,style: TextStyle(color: ColorX.text0917(),fontSize: 14.sp),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAreaContent() {
    var childs = List<Widget>.empty(growable: true);
    widget.data.forEach((key, value) {
      childs.add(Container(
        color: ColorX.appBarBg2(),
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
        width: 1.sw,
        child: Text(key,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
      ));
      childs.add(Divider(height: 1.h,color: ColorX.color_10_949,indent: 15.w,endIndent: 15.w,));
      childs.addAll(buildAreaItem(value));
    });
    return childs;
  }

  List<Widget> buildAreaItem(List<String> value) {
    var items = List<Widget>.empty(growable: true);
    value.forEach((element) {
      items.add(InkWell(
        onTap: ()=> Navigator.pop(context,element.substring(element.lastIndexOf("+"))),
        child: Container(
          color: ColorX.cardBg5(),
          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
          width: 1.sw,
          child: Text(element,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
        ),
      ));
      items.add(Divider(height: 1.h,color: ColorX.color_10_949,indent: 15.w,endIndent: 15.w,));
    });
    return items;
  }
  
}
