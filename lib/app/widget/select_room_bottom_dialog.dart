import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_select_timer_page.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';

class SelectRoomBottomDialog extends StatefulWidget {
  final Pc28LottoEntity pc28Lotto;
  final Pc28LottoRoomsTables? defRoom;
  const SelectRoomBottomDialog(this.pc28Lotto, {this.defRoom,super.key});

  @override
  State<StatefulWidget> createState() => StateSelectRoomBottomDialog();
}

class StateSelectRoomBottomDialog extends State<SelectRoomBottomDialog> {
  // var current = Pc28LottoRoomsTables().obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    Intr().qingxuanzhe,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorX.text0917(),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: widget.pc28Lotto.rooms?.map((e) => buildCategoryItem(e,)).toList() ?? [],
          ),
          // buildCategoryItem("比特币1分28","00:00:29",0,1,2),
          // buildCategoryItem("台湾宾果28","00:00:29",3,4,5),
          // buildCategoryItem("加拿大28","00:00:29",6,7,8),
        ],
      ),
    );
  }

  Widget buildCategoryItem(Pc28LottoRooms rooms) {
    print("=========> rooms.gameType${ rooms.gameType}");
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rooms.memo.em(),
                style:
                TextStyle(fontSize: 15.sp, color: ColorX.text0917()),
              ),
              TextSelectTimerPage(TextTimerLogic(type: rooms.gameType), rooms.gameType??""),
              // Text(time,style: TextStyle(fontSize: 15.sp,color: ColorX.text0917()),),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w),
          child: Row(
            children: rooms.tables
                ?.map(
                  (e) => Expanded(
                child: Row(
                  children: [
                    Visibility(
                      visible: rooms.tables?.indexOf(e) != 0,
                      child: SizedBox(
                        width: 10.w,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(e),
                        child: buildRoomItem(e),
                      ),
                    ),
                  ],
                ),
              ),
            ).toList() ?? [],
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
      ],
    );
  }

  Widget buildRoomItem(Pc28LottoRoomsTables room) {

    var select = widget.defRoom?.name == room.name && widget.defRoom?.gameType == room.gameType;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: select ? ColorX.color_fc243b:ColorX.color_e8e8e8,
                width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.h),
          alignment: Alignment.center,
          child: Text(
            room.name.em(),
            style: TextStyle(
                fontSize: 16.sp,
                color: ColorX.text0917()),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Visibility(
            visible: select,
            child: WidgetUtils().buildImage(ImageX.icon_choose, 20.r, 20.r),
          ),
        ),
      ],
    );
  }
}
