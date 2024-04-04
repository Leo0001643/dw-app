
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';

///
///选择银行
class SelectBankBottomDialog extends StatefulWidget{

  final List<BankEntity> list;
  const SelectBankBottomDialog(this.list, {super.key});

  @override
  State<StatefulWidget> createState() =>StateSelectBankBottomDialog();

}

class StateSelectBankBottomDialog extends State<SelectBankBottomDialog>{

  var banks = RxList<BankEntity>.empty(growable: true);

  @override
  void initState() {
    banks.assignAll(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      height: 0.6.sh,
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          WidgetUtils().buildTextField(340.w, 40.h, 14.sp, ColorX.text0917(), Intr().shuruyinhangmingcheng,
            backgroundColor : ColorX.cardBg3(),onChanged: (v)=> queryBanks(v),),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                return Column(
                  children: [
                    ...banks.map((e) => buildPaywayItem(e)).toList(),
                  ],
                );
              }),
            ),
          ),
          Divider(height: 1.h,color: ColorX.color_f1f1f1,),
          Align(
            alignment: Alignment.center,
            child:InkWell(
              onTap: ()=> Navigator.pop(context,null),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                child: Text(Intr().cancel,style: TextStyle(color: ColorX.text0917(),fontSize: 14.sp),),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  Widget buildPaywayItem(BankEntity item) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pop(item),
      child: Container(
        height: 40.h,
        alignment: Alignment.center,
        child: Text(item.bankName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
      ),
    );
  }

  var lastTime = DateTime.now().millisecondsSinceEpoch;

  void queryBanks(String keyword) {
    var time = DateTime.now().millisecondsSinceEpoch;
    if(time - lastTime > 1000){
      banks.clear();
      widget.list.forEach((element) {
        if(element.bankName?.contains(keyword) == true){
          banks.add(element);
        }
      });
      banks.refresh();
    }
  }

}


