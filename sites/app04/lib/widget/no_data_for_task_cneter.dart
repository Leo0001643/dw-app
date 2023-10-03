import 'package:dokit/util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../theme/color_schema.dart';

import 'package:flutter/material.dart';

class NoDataForTaskCenter extends StatefulWidget {
  const NoDataForTaskCenter({Key? key}) : super(key: key);

  @override
  State<NoDataForTaskCenter> createState() => _NoDataForTaskCenterState();
}

class _NoDataForTaskCenterState extends State<NoDataForTaskCenter>
    with TickerProviderStateMixin {
  late final GifController? controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Gif(
        autostart: Autostart.loop,
        controller: controller,
        placeholder: (context) =>
            const Center(child: CircularProgressIndicator()),
        duration: const Duration(seconds: 2),
        image: const AssetImage(
            'assets/images/activity/task_center/task_center_nodata.gif'),
      ),
    );
  }
}
