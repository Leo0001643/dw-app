import 'package:aone_common/utils/colors.dart';
import 'package:app10/app_service.dart';
import 'package:app10/theme/color_schema.dart';
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
          backgroundColor: const Color(0xFFFBFAF9),
          title: '消息详情',
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 8.r, left: 8.r, bottom: 15.r, right: 8.r),
                padding: EdgeInsets.only(
                    top: 8.r, left: 8.r, bottom: 8.r, right: 8.r),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Obx(() {
                          return Text(
                            state.title,
                            style: TextStyle(
                                color: stringToColor('0b213b'),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 8.r,
                    ),
                    Obx(() {
                      return Html(
                        data: state.desc,
                      );
                    }),
                    Row(
                      children: [
                        const Spacer(),
                        Obx(() {
                          return Text(state.date,
                              style: TextStyle(
                                  color: const Color(0xffCCCCCC),
                                  fontSize: 14.r));
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
