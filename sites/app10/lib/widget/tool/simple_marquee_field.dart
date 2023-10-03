import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

typedef SimpleMarqueeChange = Function(List<Widget> item);

class SimpleMarqueeController{
  Map<String, SimpleMarqueeChange> onChanges = Map();

  addListener(String key, SimpleMarqueeChange func){
    onChanges[key] = func;
  }

  change(List<Widget> item){
    onChanges.forEach((k,v){
      v(item);
    });
  }
}

class SimpleMarqueeField extends StatefulWidget {
  final double? width, height;
  final Axis type;
  final List<Widget>? children;
  final int milliseconds;
  final SimpleMarqueeController? controller;
  SimpleMarqueeField({Key? key,
    this.width,
    this.height,
    this.children,
    this.type = Axis.horizontal,
    this.milliseconds = 50,
    this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SimpleMarqueeFieldState();
}

class SimpleMarqueeFieldState extends State<SimpleMarqueeField> {
  ScrollController scrollController = new ScrollController();
  List<Widget> children =  [];
  late Timer timer;
  late String key;

  change(List<Widget> item){
    setState(() {
      createItem(item);
    });
  }

  createItem(List<Widget> child){
    children.clear();
    children.add(Container(width: widget.width, height: widget.height, padding: EdgeInsets.only(left: 10, right: 10)));
    child.forEach((item) {
      children.add(
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            height: widget.height,
            child: item,
          )
      );
    });
    children.add(Container(width: widget.width, height: widget.height, padding: EdgeInsets.only(left: 10, right: 10)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    key = Uuid().v1();
    if (null != widget.controller){
      widget.controller?.addListener(key, change);
    }
    createItem(widget.children!);
    if (Axis.horizontal == widget.type){
      newOffset(3, widget.milliseconds, widget.milliseconds);
    } else {
      newOffset(widget.height!, widget.milliseconds, 2000);
    }
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent){
        scrollController.jumpTo(0);
        setState(() {});
      }
    });
  }

  newOffset(double step, int milliseconds, int duration){
    timer = Timer.periodic(Duration(milliseconds: milliseconds), (item){
      setState(() {
        double val = scrollController.offset + step > scrollController.position.maxScrollExtent ?
        scrollController.position.maxScrollExtent : scrollController.offset + step;
        scrollController.animateTo(val,
            duration: new Duration(milliseconds: duration), curve: Curves.ease);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      child: ListView(
        controller: scrollController,
        scrollDirection: widget.type,
        children: children,
      ),
    );
  }
}