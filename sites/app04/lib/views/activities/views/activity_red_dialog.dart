import 'package:aone_common/data/model/entities/activity/activity_redpacket.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:gif/gif.dart';

class ActivityRedDialog extends StatefulWidget {
  ActivityRedpacket? activityRedpacket;

  ActivityRedDialog({Key? key, this.activityRedpacket}) : super(key: key);

  @override
  State<ActivityRedDialog> createState() => _ActivityRedDialogState();
}

class _ActivityRedDialogState extends State<ActivityRedDialog>
    with TickerProviderStateMixin {
  late final GifController controller1;
  int _fps = 30;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    super.initState();
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
        Gif(
          autostart: Autostart.once,
          controller: controller1,
          placeholder: (context) =>
              const Center(child: CircularProgressIndicator()),
          duration: const Duration(seconds: 1),
          // fps: _fps,
          // image: const AssetImage('assets/images/common/build.gif'),
          image: const AssetImage('assets/images/activity/red_dailog.gif'),
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
                'assets/images/activity/signin_wenhao.svg',
                width: 20,
                height: 20,
              ),
              //SvgPicture.asset('assets/images/activity/red_dailog_del.svg')
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 275,
          // bottom: 0,
          right: 0,
          child: Container(
              alignment: Alignment.center,
              // decoration:  BoxDecoration(color:  Colors.red),
              child: Text(
                widget.activityRedpacket!.message ?? '',
                style:
                    const TextStyle(color: AppTheme.shareYellow, fontSize: 18),
              )),
        )
      ],
    ));
  }
}
