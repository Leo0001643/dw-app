import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:red_task/src/entities/red_rain_info.dart';
import 'package:red_task/src/red_task_service.dart';
import 'package:red_task/src/widgets/join_popup.dart';
import 'package:red_task/src/widgets/red_rain_popup.dart';

import '../utils/utils.dart';

class RedThumbnailWrapper extends StatelessWidget {
  final Widget? child;
  final Color? cancelIconColor;
  final AlignmentGeometry? cancelIconAlignment;
  const RedThumbnailWrapper(
      {Key? key,
      this.child,
      this.cancelIconColor = Colors.grey,
      this.cancelIconAlignment = Alignment.topRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = RedTaskService.to;
    print('位置 == ${service.redTaskInfo.weizhi}');
    return Obx(
      () => Stack(
        children: [
          if (child != null) Positioned.fill(child: child!),
          if (service.showThumbnail)
            Align(
              alignment: getAlignment(service.redTaskInfo.weizhi!),
              child: GestureDetector(
                onTap: () {    
                     if (service.redType == 2){
                       
                      service.judgeCanGetHb(((res) async{
                       Get.dialog(ActivityRedDialog(redRainEntity: res,));
                       }));
                     }else
                     {
                      Get.dialog(const RedJoinPopup());
                     }
                },
                child: Container(
                  width: 95.r,
                  height: 95.r,
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        service.redTaskInfo.img != ''
                            ? service.redTaskInfo.img!
                            : RedImage.fromStatic(service.redTaskInfo.jiaotu!),
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: cancelIconAlignment!,
                    child: GestureDetector(
                      onTap: () => service.showThumbnail = false,
                      child: Icon(
                        Icons.cancel,
                        color: cancelIconColor!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Alignment getAlignment(int position) {
    print('红包位置position == ${position}');
    //1 左上 2 左下 3 右上 4 右下 0无
    switch (position) {
      case 1:
        return Alignment.topLeft;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.topRight;
      case 4:
        return Alignment.bottomRight;
      default:
        return Alignment.bottomLeft;
    }
  }
}
