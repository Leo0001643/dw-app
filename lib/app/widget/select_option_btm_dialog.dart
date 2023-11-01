
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class SelectOptionBtmDialog extends StatefulWidget{

  String title;
  List data;

  SelectOptionBtmDialog(this.title, this.data, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectOptionBtmDialog();

}

class StateSelectOptionBtmDialog extends State<SelectOptionBtmDialog>{

  var data = List.empty(growable: true);

  var currentIndex = 0.obs;

  @override
  void initState() {
    data.addAll(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var childs = List<Widget>.empty(growable: true);
    childs.add(buildHeader());
    childs.add(SizedBox(height: 10.h,));

    childs.addAll(data.map((e) {
      return Obx(() {
        return InkWell(
          onTap: (){
            currentIndex.value = data.indexOf(e);
          },
          child: buildOptionItem(e,currentIndex.value == data.indexOf(e)),
        );
      });
    }).toList());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: childs,
      ),
    );
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(widget.title,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: WidgetUtils().buildElevatedButton(Intr().confirm, 50.w, 26.h,textSize: 12.sp,
                bg:ColorX.color_fc243b,onPressed: (){
                  Navigator.of(context).pop(data[currentIndex.value]);
                }),
          ),
        ),
      ],
    );
  }

  Widget buildOptionItem(String option,bool select) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Row(
            children: [
              Image.asset(select ? ImageX.icon_select : ImageX.icon_unselect),
              SizedBox(width: 5.w,),
              Text(option,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
            ],
          ),
          SizedBox(height: 15.h,),
          Divider(color: ColorX.color_10_949,height: 1.h,),
        ],
      ),
    );
  }
  
}
