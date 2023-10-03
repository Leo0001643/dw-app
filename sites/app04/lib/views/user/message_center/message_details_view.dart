import 'package:aone_common/utils/colors.dart';
import 'package:app04/app_service.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../theme/theme_scaffold.dart';
import 'message_center_logic.dart';

class MessageDetailsView extends GetView<MessageCenterLogic> {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = MessageCenterLogic.to.state;
    return GetBuilder<MessageCenterLogic>(builder: (_) {
      return ThemeScaffold(
          backgroundColor: AppTheme.normalBgColor,
          title: '站内信',
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.w, left: 12.w, right: 12.w),
                padding: EdgeInsets.symmetric(vertical: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Obx(() {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              state.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.w,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Html(
                          data: state.desc,
                        ),
                      );
                    }),
                    Row(
                      children: [
                        const Spacer(),
                        Obx(() {
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Text(
                              state.date,
                              style: TextStyle(
                                color: const Color(0xffCCCCCC),
                                fontSize: 10.w,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    state.isHuodong == 1
                        ? GestureDetector(
                            onTap: () {
                              AppService.to.toCustomerService();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  gradient: AppTheme.primaryGradient,
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: const Text("咨询客服",
                                  style: TextStyle(color: Color(0xffffffff))),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
