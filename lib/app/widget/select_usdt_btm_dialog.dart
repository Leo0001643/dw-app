
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/ui/bean/area_index_bean.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';

class SelectUsdtBtmDialog extends StatefulWidget{

  final List<UsdtChannelEntity> data;
  const SelectUsdtBtmDialog(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectUsdtBtmDialog();

}

class StateSelectUsdtBtmDialog extends State<SelectUsdtBtmDialog>{

  var data = List<AreaIndexBean>.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: widget.data.map((e) => buildUsdtItem(e)).toList(),
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

  Widget buildUsdtItem(UsdtChannelEntity e) {
    var color = isEmpty(e.account) && e.status == 1 ? ColorX.text0917() :ColorX.text5d6();
    var text = e.status == 1 ? e.typeName() : "${e.typeName()}(${Intr().tingyong_termi})";
    return InkWell(
      onTap: (){
        if(isEmpty(e.account) && e.status == 1){
          Navigator.pop(context,e);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
        child: Text(text,style: TextStyle(fontSize: 14.sp,color: color),),
      ),
    );
  }

  
}
