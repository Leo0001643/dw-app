import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
import 'bind_bank_logic.dart';

///绑定银行卡
class BindBankPage extends StatefulWidget {
  const BindBankPage({Key? key}) : super(key: key);

  @override
  State<BindBankPage> createState() => _BindBankPageState();
}

class _BindBankPageState extends State<BindBankPage> {
  final logic = Get.find<BindBankLogic>();
  final state = Get.find<BindBankLogic>().state;

  @override
  void dispose() {
    Get.delete<BindBankLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().bangdingyinhangka,
          msg: true, drawer: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 27.w, top: 31.h, bottom: 20.h),
              child: Obx(() {
                var length = state.userDraw.value.banks.em();
                return Text(
                  Intr().wodeyinhangka_(
                      ["$length", "${state.maxCount - length}"]),
                  style: TextStyle(fontSize: 16.sp, color: ColorX.text0917()),
                );
              }),
            ),
            Obx(() {
              return Visibility(
                visible: unEmpty(state.userDraw.value.banks),
                child: Column(
                  children: [
                    ...state.userDraw.value.banks.map((e) => buildBankItem(e)).toList(),
                  ],
                ),
              );
            }),
            Obx(() {
              return Visibility(
                visible: state.userDraw.value.banks.em() < state.maxCount,
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.add_bank,
                      arguments: state.userDraw.value),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg3(),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 181.h,
                    // padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
                    margin: EdgeInsets.symmetric(horizontal: 27.w),
                    child: GFBorder(
                      dashedLine: [5, 7],
                      color: ColorX.text586(),
                      type: GFBorderType.rRect,
                      radius: Radius.circular(10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color: ColorX.iconBlack(),
                              size: 24.r,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            Intr().tianjiayinhangka,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: ColorX.text0917(),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            Intr().zuiduoketianjia_(["${state.maxCount}"]),
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorX.text586()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: Intr().wenxintixing_yinhangka,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorX.text586(), height: 1.8),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: InkWell(
                      onTap: () {
                        eventBus.fire(ChangeMainPageEvent(3)); //转到客服显示
                        Get.until((ModalRoute.withName(Routes.main)));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          Intr().lxkf,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: ColorX.text0917(),
                            height: 1.8,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3.0,
                            decorationColor: Colors.black, // 设置下划线颜色
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBankItem(UserDrawDetailBanks item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w),
      decoration: BoxDecoration(
        color: ColorX.color_ff5164,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.bankName.em(),
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            Intr().kahao,
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
          ),
          Text(
            item.bankAccount.em(),
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            Intr().cikaren,
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.userDraw.value.realname.em(),
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(ImageX.icon_union_grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
