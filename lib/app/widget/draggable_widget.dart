

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/logger.dart';

class DraggableWidget extends StatefulWidget{

  final Widget child;
  final Function(Offset offset)? onOffsetChanged;


  DraggableWidget(this.child,this.onOffsetChanged,{super.key});

  @override
  State<StatefulWidget> createState() => _StateDraggableWidget();

}

class _StateDraggableWidget extends State<DraggableWidget> with WidgetsBindingObserver{

  late Rx<Offset> rxOffset;

  var isDrag = false.obs;
  Orientation? _previousOrientation;

  @override
  void initState() {
    rxOffset = Offset(20, 100).obs;
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(Duration(milliseconds: 100),(){
      _previousOrientation = MediaQuery.of(context).orientation;
    });
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
    var current = MediaQuery.of(context).orientation;
    if(_previousOrientation !=null && _previousOrientation != current){
      _previousOrientation = current;
      logger("走这里了吗");
      final newOrientation = MediaQuery.of(context).orientation;
      if(newOrientation == Orientation.portrait){
        rxOffset.value = Offset(20, 100);
        rxOffset.refresh();
      }else{
        rxOffset.value = Offset(50, 10);
        rxOffset.refresh();
      }
      widget.onOffsetChanged?.call(rxOffset.value);
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
            widget.onOffsetChanged?.call(rxOffset.value);
          },
          onDragEnd: (details){
            isDrag.value = false;
            rxOffset.value = details.offset;
            rxOffset.refresh();
          },
          onDraggableCanceled: (velocity,offset){
            loggerArray(["输出一下最后的位置",rxOffset.value,offset]);
            isDrag.value = false;
            rxOffset.value = offset;
            rxOffset.refresh();
          },
          child: isDrag.value ? Container() :widget.child,
        ),
      );
    });
  }






}




