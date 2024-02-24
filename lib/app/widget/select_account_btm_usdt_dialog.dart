
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';

import '../../ui/bean/usdt_entity.dart';

class SelectAccountBtmUsdtDialog extends StatefulWidget{

  final List<UsdtEntity> data;

  const SelectAccountBtmUsdtDialog(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectAccountBtmDialog();

}

class StateSelectAccountBtmDialog extends State<SelectAccountBtmUsdtDialog>{

  var data = List<UsdtEntity>.empty(growable: true);


  @override
  void initState() {
    data.addAll(widget.data);
    data.add(UsdtEntity(account: Intr().dianjitianjiazhanghu));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var childs = List<Widget>.empty(growable: true);
    childs.add(Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(Intr().qingxuanzhetikuanzhanghu,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
      ),
    ),);
    childs.add(SizedBox(height: 10.h,));

    childs.addAll(data.map((e) { return buildOptionItem(e); }).toList());

    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: ()=> Navigator.pop(context,null),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(ImageX.icon_close_dialog,width: 20.r,fit: BoxFit.fill,),
              ),
            ),
          ),
          Column(children: childs,),
        ],
      )
    );
  }

  Widget buildOptionItem(UsdtEntity option) {
    return InkWell(
      onTap: (){
        if(unEmpty(option.account)){
          Navigator.pop(context,option);
        }else {///绑定银行卡
          Get.offAndToNamed(Routes.bind_usdt);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Center(
              child: Text(option.account.toString(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
            ),
            SizedBox(height: 15.h,),
            Divider(color: ColorX.color_10_949,height: 1.h,),
          ],
        ),
      ),
    );
  }
  
}
