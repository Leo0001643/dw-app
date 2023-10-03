import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import '../../../theme/color_schema.dart';

class ShowHtmlDialog extends StatelessWidget {
  String? title;
  String? showContent;
  ShowHtmlDialog({Key? key, this.title, this.showContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(
              color: AppTheme.onPrimary, borderRadius: BorderRadius.circular(8)),
          width: Get.width - 55.r,
          height: Get.height * 2 / 3,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 45.r,
                child: Text(
                  title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              ),
              Container(
                height: Get.height * 2 / 3 - 90.r,
                width: Get.width - 55.r,
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    child: Html(
                      data: showContent,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 45.r,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: const Text(
                    '确定',
                    style: TextStyle(color: AppTheme.onPrimary),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
