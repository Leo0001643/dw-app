import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/signin_everyday_controller.dart';

class SigninMonthView extends StatelessWidget {
  SigninMonthView({Key? key}) : super(key: key);
  SigninEverydayController controller = SigninEverydayController.to;
  // getCurrentMonthAllDay();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Container(
          padding: EdgeInsets.only(left: 17.5.r, right: 17.5.r),
          // height: 280,
          width: Get.width - 20.r,
          decoration: BoxDecoration(
              // color: stringToColor('ffffff'),
              borderRadius: BorderRadius.circular(5.r)),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: controller.preMonth,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 44.r,
                        height: 44.r,
                        padding: EdgeInsets.only(right: 8.r),
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/activity/left_arrow_icon.svg",
                          width: 12.h,
                          height: 12.h,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30.r,
                        width: 40.r,
                        child: Center(
                            child: Text(
                          controller.currentMonth.toString() + '月',
                          style: const TextStyle(color: Colors.black),
                        ))),
                    GestureDetector(
                      onTap: controller.nextMonth,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 44.r,
                        height: 44.r,
                        padding: EdgeInsets.only(left: 8.r),
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          "assets/images/activity/right_arrow_icon.svg",
                          width: 12.h,
                          height: 12.h,
                        ),
                      ),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.state.weekListForApp4.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: stringToColor('3A393C'),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(e,
                        style: (e == "周日" || e == "周六")
                            ? const TextStyle(color: Colors.red)
                            : const TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.r,
              ),
              buileDayGridView(),
            ],
          ),
        ),
      ),
    );
  }

  buileDayGridView() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.r),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: getMonthAllDay(controller.currentMonth.value) -
            1 +
            (getStartWeekWithMonth(controller.currentMonth.value) ?? 0) as int,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 17.5,
        ),
        itemBuilder: (_, int index) {
          return buildDayItem(controller.showDayState(index));
        },
      ),
    );
  }

  buildDayItem(String index) {
    return ClipOval(
        child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: controller.getSignInRecordState(index).bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        index.toString(),
        style: TextStyle(
            color: controller.getSignInRecordState(index).color, fontSize: 15),
      ),
    ));
  }
}
