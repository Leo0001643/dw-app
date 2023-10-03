import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/widgets/recharge_scaffold.dart';
import 'package:generics/src/cashier/widgets/theme_card_cell.dart';
import 'package:get/get.dart';

import 'controllers/transfer_channel_controller.dart';

class TransferChannelView extends GetView<TransferChannelController> {
  const TransferChannelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RechargeTheme _theme = RechargeTheme();
    return RechargeScaffold(
      title: controller.args.typeTitle ?? '转账汇款',
      backgroundColor: _theme.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.args.typeTitle ?? '转账汇款'} > ${controller.args.category.classname}",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: RechargeTheme().mainTextColor,
                  fontWeight: FontWeight.w700),
            ),
            Column(
              children: controller.args.category.item!
                  .mapIndexed(
                    (TransferProduct e, int index) => ThemeCardCell(
                        onTap: () => controller.onNavigateToFormPage(e),
                        child: Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            color: _theme.cardBackgroundColor,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: 150.r),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.r),
                                    child: Text(
                                      e.itemName!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: _theme.neutralColor2,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '(单笔限额:',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: _theme.neutralColor2,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: _transferLimit(e),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: _theme.dangerColor,
                                          ),
                                        ),
                                        const TextSpan(text: ')'),
                                      ],
                                    ),
                                  ),
                                ],
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
            if (_theme.isHideChannelTips != true)
              RichText(
                text: TextSpan(
                  text: '温馨提示:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _theme.dangerColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "目前我司推出以上最新收款账户，存款前务必核实我司收款账户限额是否与您预计存款金额一致，请按照页面收款账号提示单笔限额进行存款，避免出现无法提交存款申请的情况，导致系统无法及时为您添加款项。",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _theme.neutralColor2,
                      ).copyWith(
                        color: _theme.dangerColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _transferLimit(TransferProduct item) {
    int min = double.parse(item.paymin!).round();
    int max = double.parse(item.paymax!).round();

    return '$min元-$max元';
  }
}
