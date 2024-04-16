import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/ota_version_entity.dart';


class OtaUpdateDialog extends StatefulWidget{

  final OtaVersionIOS entity;
  OtaUpdateDialog(this.entity);

  @override
  State<StatefulWidget> createState() => StateOtaUpdateDialog();

}

class StateOtaUpdateDialog extends State<OtaUpdateDialog>{


  @override
  Widget build(BuildContext context) {

    ///是否强制更新
    var must = widget.entity.isMust();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 0.8.sw,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40.r,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorX.cardBg5(),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.h,),
                        Center(
                          child: Text(Intr().faxianxinbanben,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w700),),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(widget.entity.note.em(),
                            style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),),maxLines: 10,overflow: TextOverflow.ellipsis,),
                        ),
                        SizedBox(height: 15.h,),
                        Row(
                          mainAxisAlignment: must ? MainAxisAlignment.center:MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: !must,
                              child: WidgetUtils().buildElevatedButton(Intr().xiacizaishuo, 116.w, 40.h,
                                  bg: ColorX.cardBg3(),
                                  textColor: ColorX.text586(), onPressed: () => Navigator.of(context).pop(false)),
                            ),
                            WidgetUtils().buildElevatedButton(Intr().lijigengxin, 116.w, 40.h,
                                bg: ColorX.color_fc243b,
                                textColor: Colors.white, onPressed: ()=> Navigator.of(context).pop(true))
                          ],
                        ),
                        SizedBox(height: 15.h,),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90.r,
                    height: 90.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45.r),
                    ),
                    child: WidgetUtils().buildImage(ImageX.ic_ota_update, 60.r, 60.r,fit: BoxFit.fill),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

}
