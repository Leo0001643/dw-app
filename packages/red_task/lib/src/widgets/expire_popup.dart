import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_task/src/entities/entities.dart';
import 'package:red_task/src/red_task_service.dart';
import 'package:red_task/src/widgets/animation.dart';

import '../utils/utils.dart';

typedef WeekDayCompact = Map<int, dynamic>;

WeekDayCompact weekDayCompact = {
  1: {
    'cn': '一',
    'en': 'Mon.',
  },
  2: {
    'cn': '二',
    'en': 'Tue.',
  },
  3: {
    'cn': '三',
    'en': 'Wed.',
  },
  4: {
    'cn': '四',
    'en': 'Thu',
  },
  5: {
    'cn': '五',
    'en': 'Fri',
  },
  6: {
    'cn': '六',
    'en': 'Sat.',
  },
  7: {
    'cn': '日',
    'en': 'Sun.',
  },
};

class ExpirePopup extends StatelessWidget {
  final Grab grab;

  const ExpirePopup({Key? key, required this.grab}) : super(key: key);

  String get activeWeekday {
    return grab.envelopeTime == 4
        ? grab.day!
        : grab.envelopeTime == 1
            ? 'red.weekly'.tr
            : 'red.everyday'.tr;
  }

  String get formattedWeekDays {
    List<int> weekday = grab.weekDay ?? [];
    if (weekday.isEmpty) return '';
    if (weekday.length == 7) return 'red.everyday'.tr;
    print('语言 == ${Get.locale!.countryCode}');
    String languageCode = (Get.locale!.countryCode ?? 'EN').toLowerCase();
    
    print("语言标识" + languageCode);
    weekday.sort();
    return weekday
        .map((e) => weekDayCompact[e][languageCode])
        .where((element) => element != null)
        .join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(builder: (context, orientation) {
        double top = orientation == Orientation.landscape ? 50 : 115;
        return Stack(
          children: 
          RedTaskService.to.showType == 2 ? [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ScaleAnimation(
                    begin: 0.9,
                    end: 1.05,
                    child: RedImage.redActStandard(
                      'clt4-2.png',
                      width: 380.r,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 16.r),
                    child: RedImage.redActStandard(
                      'clt4-1${isCN() ? '' : 'e'}.png',
                      width: 320.r,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -5.r),
                    child: SizedBox(
                      width: 220.r,
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                            text: grab.envelopeTime != 3 ? activeWeekday : null,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: RedTaskService.to.showType == 2 ?AppRedTheme.GrabTimeColor : const Color.fromRGBO(255, 102, 51, 1),
                            ),
                            children: [
                              if (grab.envelopeTime == 1)
                                TextSpan(text: formattedWeekDays),
                              if (grab.hour?.isNotEmpty ?? false)
                                TextSpan(
                                  text:
                                      ' ${grab.hour![0].toString() + ':00'} ~ ${grab.hour![1].toString() + ':00'}',
                                )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: top.r,
              right: 50.r,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 24.sp,
                ),
                color: Colors.white,
              ),
            )
          ]:
           [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ScaleAnimation(
                    begin: 0.9,
                    end: 1.05,
                    child: RedImage.redActStandard(
                      'clt4-2.png',
                      width: 380.r,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 16.r),
                    child: RedImage.redActStandard(
                      'clt4-1.png',
                      width: 320.r,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 3.r),
                    child: SizedBox(
                      width: 190.r,
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                            text: grab.envelopeTime != 3 ? activeWeekday : null,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color.fromRGBO(255, 102, 51, 1),
                            ),
                            children: [
                              if (grab.envelopeTime == 1)
                                TextSpan(text: formattedWeekDays),
                              if (grab.hour?.isNotEmpty ?? false)
                                TextSpan(
                                  text:
                                      ' ${grab.hour![0].toString() + ':00'} ~ ${grab.hour![1].toString() + ':00'}',
                                )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: top.r,
              right: 50.r,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 24.sp,
                ),
                color: Colors.white,
              ),
            )
          ],
        );
      }),
    );
  }
}
