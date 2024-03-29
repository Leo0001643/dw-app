
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

class SelectAccountBtmDialog extends StatefulWidget{

  final List data;

  const SelectAccountBtmDialog(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectAccountBtmDialog();

}

class StateSelectAccountBtmDialog extends State<SelectAccountBtmDialog>{

  var data = List.empty(growable: true);

  @override
  void initState() {
    data.addAll(widget.data);
    data.add(UserDrawDetailBanks(bankName: Intr().dianjitianjiazhanghu));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
          Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().qingxuanzhetikuanzhanghu,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
              ),
              SizedBox(height: 10.h,),
              ...data.map((e) { return buildOptionItem(e); }).toList()
            ],
          ),
        ],
      )
    );
  }

  Widget buildOptionItem(option) {
    return InkWell(
      onTap: (){
        if(option.toString() == Intr().dianjitianjiazhanghu){
          Get.offAndToNamed(option is UserDrawDetailBanks ? Routes.bind_bank : Routes.bind_usdt);
        } else {///绑定银行卡
          Navigator.pop(context,option);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Center(
              child: Text(option.toString(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
            ),
            SizedBox(height: 15.h,),
            Divider(color: ColorX.color_10_949,height: 1.h,),
          ],
        ),
      ),
    );
  }
  
}
