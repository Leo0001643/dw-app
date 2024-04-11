

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';
import 'package:sprintf/sprintf.dart';

class DraggableWidget extends StatefulWidget{

  final Widget child;

  DraggableWidget(this.child,{super.key});

  @override
  State<StatefulWidget> createState() => _StateDraggableWidget();

}

class _StateDraggableWidget extends State<DraggableWidget> with WidgetsBindingObserver{

  late Rx<Offset> rxOffset;

  var isDrag = false.obs;

  @override
  void initState() {
    rxOffset = Offset(20, 100).obs;
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final newOrientation = MediaQuery.of(context).orientation;
    if(newOrientation == Orientation.portrait){
      rxOffset.value = Offset(20, 100);
      rxOffset.refresh();
    }else{
      rxOffset.value = Offset(50, 10);
      rxOffset.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned(
        top: rxOffset.value.dy,
        left: rxOffset.value.dx,
        child: Draggable(
          feedback: widget.child,
          onDragUpdate: (details){
            // logger(details.localPosition);
            isDrag.value = true;
            rxOffset.value = details.localPosition;
            rxOffset.refresh();
          },
          onDraggableCanceled: (velocity,offset){
            isDrag.value = false;
            rxOffset.value = Offset(offset.dx,offset.dy);
            rxOffset.refresh();
          },
          child: isDrag.value ? Container() :widget.child,
        ),
      );
    });
  }






}




