

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

class DraggableWidget extends StatefulWidget{

  final HomeLogic logic;

  final Pic30BackEntity data;

  DraggableWidget(this.logic,this.data, {super.key});

  @override
  State<StatefulWidget> createState() => _StateDraggableWidget();

}

class _StateDraggableWidget extends State<DraggableWidget>{

  late Rx<Offset> rxOffset;

  // var status = Intr().weikaishi.obs;

  @override
  void initState() {
    // 1：居左 2：居中 3：居右
    switch(widget.data.logo?.position){
      case "2":
        rxOffset = Offset(0.5.sw, 0.75.sh).obs;
        break;
      case "3":
        rxOffset = Offset(1.sw, 0.75.sh).obs;
        break;
      default:
        rxOffset = Offset(0, 0.75.sh).obs;
        break;
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned(
        top: rxOffset.value.dy,
        left: rxOffset.value.dx,
        child: Draggable(
          feedback: Container(),
          onDragUpdate: (details){
            // logger(details.localPosition);
            rxOffset.value = details.localPosition;
            rxOffset.refresh();
          },
          onDraggableCanceled: (velocity,offset){
            rxOffset.value = Offset(offset.dx,offset.dy);
            rxOffset.refresh();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: ()=> widget.logic.state.hongbaoManual.value = false,
                child: Image.asset(ImageX.ic_delete_grey,color: ColorX.color_fe2427,),
              ),
              GestureDetector(
                onTap: onJumpWeb,
                child: Stack(
                  children: [
                    isEmpty(widget.data.url) ? Container() : Image.network("${widget.data.url.em()}${widget.data.logo?.picUrl.em()}",width: 80.r,),
                    Positioned(
                      right: 0,left: 0,bottom: 3.h,
                      child: Text(widget.data.logo?.status ?? "",style: TextStyle(fontSize: 13.sp,color: ColorX.color_ffe0ac),textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

//http://180.150.128.168:20001/#/Hongbao/63030302451ba3b3a8d30c29bf8ec4e6/xiao/en
  void onJumpWeb() {
    var link = "http://soptj9qq.com/m";//Get.find<MainLogic>().state.webConfig?.agDomain?.list?.first;

    var path = "/#/Hongbao/1/2/3";///${Intr().currentLocale().languageCode}

    Get.toNamed(Routes.html,arguments: HtmlEvent(data: "$link$path",isHtmlData: false,pageTitle: Intr().hongbaohuodong));

  }






}




