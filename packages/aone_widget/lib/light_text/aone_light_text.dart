import 'package:flutter/material.dart';

class AoneLightText {
  static build(String text){
    return Text(text,style: const TextStyle(color: Colors.white,fontSize: 10),);
  }
  static buildColor(String text,Color color){
    return Text(text,style: TextStyle(color: color,fontSize: 10),);
  }

  static buildColorFont(String text,Color color,double fontSize){
    return Text(text,style: TextStyle(color: color,fontSize: fontSize),);
  }

  static buildColorFontBold(String text,Color color,double fontSize){
    return Text(text,style: TextStyle(color: color,fontSize: fontSize,fontWeight: FontWeight.bold),);
  }

  static buildWithFont(String text,double fontSize){
    return Text(text,style: TextStyle(color: Colors.white,fontSize: fontSize),);
  }
  static buildWidth(String text,double widths){
    return Container(
      width: widths,
      alignment: Alignment.center,
      child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 10),maxLines: 1,),
    );
  }

}