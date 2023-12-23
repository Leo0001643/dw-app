
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

class NoticeDialog extends StatefulWidget{

  final String title;
  final String msg;

  const NoticeDialog(this.title, this.msg, {super.key});

  @override
  State<StatefulWidget> createState() => StateNoticeDialog();

}

class StateNoticeDialog extends State<NoticeDialog>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                width: 0.7.sw,
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(color: ColorX.cardBg5(),borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    Text(widget.title,style: TextStyle(fontSize: 16.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w700,),),
                    SizedBox(height: 10.h,),
                    Text(widget.msg,style: TextStyle(fontSize: 13.sp,color: ColorX.textBlack()),textAlign: TextAlign.center,),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: ()=> Navigator.pop(context,true),
                child: Image.asset(ImageX.icon_no,width: 30.r,height: 30.r,fit: BoxFit.fill,),
              )
            ],
          ),
        ],
      ),
    );
  }

}



