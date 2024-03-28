
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  var scroller = FixedExtentScrollController();
  var current = 0;

  @override
  void initState() {
    ///如果内容很多，可以滑动到中间区域，这样弹窗上部就不会预留出很大的空白
    Future.delayed(const Duration(milliseconds: 100),(){
      if(widget.list.em() > 10 && scroller.hasClients){
        scroller.jumpTo((widget.list.em()/2) * 40.h);
      }
    });
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
          Expanded(
            child: CupertinoPicker(
              itemExtent: 40.h, // 设置单个选项高度
              onSelectedItemChanged: (int index) {
                current = index;
              },
              scrollController: scroller,
              diameterRatio: 1.8,
              squeeze: 1.1,
              children: widget.list.map((e) => buildPaywayItem(e)).toList(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: WidgetUtils().buildElevatedButton(Intr().tijiao, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
              Navigator.of(context).pop(widget.list[current]);
            }),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  Widget buildPaywayItem(BankEntity item) {
    return Container(
      height: 40.h,
      alignment: Alignment.center,
      child: Text(item.bankName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
    );
  }

}


