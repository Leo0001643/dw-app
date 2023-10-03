import 'package:aone_common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../entities/red_rain_info.dart';
import 'package:gif/gif.dart';

class ActivityRedDialog extends StatefulWidget {
  RedRainEntity? redRainEntity;

  ActivityRedDialog({Key? key, this.redRainEntity}) : super(key: key);

  @override
  State<ActivityRedDialog> createState() => _ActivityRedDialogState();
}

class _ActivityRedDialogState extends State<ActivityRedDialog>
    with TickerProviderStateMixin {
  late final GifController controller1;
  int _fps = 30;
  late bool isShow = false;
  @override
  void initState() {
    controller1 = GifController(vsync: this);
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isShow = true;
      });
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        Container(
          width: 365,
          height: 410,
          child: Gif(
            autostart: Autostart.once,
            controller: controller1,
            placeholder: (context) =>
                const Center(child: CircularProgressIndicator()),
            duration: const Duration(seconds: 1),
            image: const AssetImage('assets/images/activity/red_dailog.gif'),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          // bottom: 0,
          right: -275.r,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                    'assets/images/activity/red_dailog_del.svg')),
          ),
        ),
        if (isShow)
          Positioned(
            left: 0,
            top: 225,
            right: 0,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.redRainEntity!.message ?? '',
                  style: const TextStyle(
                      color: Color.fromRGBO(182, 107, 26, 1), fontSize: 18),
                )),
          )
      ],
    ));
  }
}
