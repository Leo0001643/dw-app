import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/color_schema.dart';
import '../../theme/theme_scaffold.dart';
import '../../widget/misc/theme_card.dart';
import '../../widget/misc/theme_card_cell.dart';
import 'controllers/transfer_channel_controller.dart';

class TransferChannelView extends GetView<TransferChannelController> {
  const TransferChannelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      title: '充值渠道',
      body: SafeArea(
        minimum: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "线上支付 > ${controller.args.category.classname}",
              style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.onBackground,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.r,
            ),
            Column(
              children: controller.args.category.item!
                  .mapIndexed(
                    (e, int index) => ThemeCardCell(
                        onTap: () => controller.onNavigateToFormPage(e),
                        child: Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //设置四周圆角 角度
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.23),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                            //设置四周边框
                            // border: Border.all(
                            //   width: 1,
                            //   color: const Color(0xff262628),
                            // ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 11.r,
                              ),
                              SizedBox(
                                  width: 30.r,
                                  height: 30.r,
                                  child: SvgPicture.network(
                                    controller.args.category.classimg ?? "",
                                    width: 30.r,
                                    height: 30.r,
                                    fit: BoxFit.fill,
                                  )),
                              // Image.network(
                              //   staticImageResolver(
                              //     '/static/comm/gameImage/wapChongzhiv2/${controller.args.category.tag}.png',
                              //   ),
                              //   width: 30.r,
                              //   height: 30.r,
                              //   fit: BoxFit.fill,
                              // ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.r),
                                  child: Text(
                                    e.itemName!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.w,
                                      color: const Color(0xff666666),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.r),
                                child: RichText(
                                  text: TextSpan(
                                    text: '(单笔限额:',
                                    style: TextStyle(
                                      fontSize: 12.w,
                                      color: const Color(0xff666666),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: transferLimit(e),
                                        style: TextStyle(
                                          fontSize: 12.w,
                                          color: const Color(0xff666666),
                                        ).copyWith(
                                          color: AppTheme.danger,
                                        ),
                                      ),
                                      const TextSpan(text: ')'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 15.r,
            ),
            const Spacer(),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: '温馨提示:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "目前我司推出以上最新收款账户，存款前务必核实我司收款账户限额是否与您预计存款金额一致， 请按照页面收款账号提示单笔限额进行存款，避免出现无法提交存款申请的情况，导致系统无法及时为您添加款项。",
                        style: AppTheme.regularStyleWithNotBold.copyWith(
                          color: AppTheme.danger,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
