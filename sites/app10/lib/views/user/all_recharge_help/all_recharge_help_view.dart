import 'package:aone_widget/html_renderer/html_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app_service.dart';
import '../../../theme/theme_scaffold.dart';
import 'all_recharge_help_controller.dart';

/// 单独的充值教程（包含所有充值方法）
class AllRechargeHelpView extends GetView<AllRechargeHelpController> {
  const AllRechargeHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AllRechargeHelpController());
    return ThemeScaffold(
      title: '充值教程',
      backgroundColor: const Color(0xFFE6E8ED),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: controller.allTutorials.length,
              itemBuilder: (BuildContext context, int index) {
                final element = controller.allTutorials[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      AllRechargeDetailView(
                        title: element.title ?? "",
                        content: element.body!,
                      ),
                    );
                  },
                  child: Container(
                    height: 44.r,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10.r),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.r, right: 17.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element.title!,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.normal),
                          ),
                          const Image(
                            width: 9,
                            height: 12,
                            color: Color(0xFFE6E8ED),
                            image: AssetImage(
                                'assets/images/recharge_arrow_right.png',
                                package: 'generics'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class AllRechargeDetailView extends StatelessWidget {
  final String title;
  final String content;

  const AllRechargeDetailView({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      title: title,
      actions: [
        IconButton(
            onPressed: () {
              AppService.to.toCustomerService();
            },
            icon: Image.asset(
              'assets/images/user/kefu.png',
              width: 20,
              height: 20,
            ))
      ],
      body: content == ''
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: HtmlRenderer(
                data: content,
              ),
            ),
    );
  }
}
