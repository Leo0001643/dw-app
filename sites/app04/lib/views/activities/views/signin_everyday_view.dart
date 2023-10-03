import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_state.dart';
import 'package:aone_common/data/data.dart';
import 'package:aone_common/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import '../../../tab/controllers/main_tabbar_controller.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/misc/dj_image.dart';
import '../controllers/signin_everyday_controller.dart';
import '../widgets/signin_widgets/signin_instructions.dart';
import '../widgets/signin_widgets/signin_month_view.dart';
import '../widgets/signin_widgets/signinday_view.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);
  SigninEverydayController sininLogic = Get.put(SigninEverydayController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninEverydayController>(builder: (_) {
      return ThemeScaffold(
        title: '签到中心',
        appBarGradient: const LinearGradient(
            colors: [Color(0xFF2F2F30), Color(0xFF2F2F30)]),
        backgroundColor: Color(0xFF2F2F30),
        actions: _titleBtnViews(),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Stack(children: [
                Container(
                  height: 1.sh,
                  width: 1.sw,
                  margin: EdgeInsets.only(top: 190.r),
                  padding: EdgeInsets.only(top: 100),
                  color: Colors.white,
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.r).copyWith(
                    bottom: context.mediaQueryViewPadding.bottom,
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildTopView(),
                      _buildSigninContentView(),
                      GestureDetector(
                          onTap: () {
                            Get.until((route) =>
                                (route as GetPageRoute).settings.name ==
                                Routes.main);
                            MainTabbarController.to.jumpToPage(1);
                          },
                          child: Container(
                            width: Get.width - 24,
                            height: 70,
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/activity/sign/signin_more_fuli.png'),
                            )),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 33),
                              child: Text(
                                '领取更多福利',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildFootGameView(),
                    ],
                  ),
                ),
              ]);
            },
          ),
        ),
      );
    });
  }

  List<Widget> _titleBtnViews() {
    List<Widget> _list = [];

    _list.add(InkWell(
        onTap: () {
          print('签到说明');
          Get.dialog(const SigninInstructions());
        },
        child: Container(
          padding: EdgeInsets.only(right: 15.r),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/activity/sign/signin_wenhao.svg',
                width: 20,
                height: 20,
              ),
            ],
          ),
        )));
    return _list;
  }

  _buildTopView() {
    return Container(
        padding: const EdgeInsets.only(top: 15, bottom: 20),
        child: GestureDetector(
          onTap: () {
            sininLogic.goToSignin();
          },
          child: Container(
            width: 102.r,
            height: 102.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color((0xFFF9EAC4)),
                  Color((0xFFE8B36E)),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(51.r)),
            child: Text(
              sininLogic.sininData?.todayIsQiandao ?? false
                  ? '签到\n成功'
                  : '立即\n签到',
              style: TextStyle(fontSize: 24.r, fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  _buildSigninContentView() {
    return Container(
      width: Get.width - 20.r,
      margin: EdgeInsets.only(bottom: 5.r),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.23),
          blurRadius: 2.0,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeaderContent(),
          _buildSininContent(),
          _buildSigninFootButton(),
          if (sininLogic.showMore) SigninMonthView(),
        ],
      ),
    );
  }

  _buildHeaderContent() {
    return Container(
      margin: EdgeInsets.only(
        top: 15.r,
      ),
      child: Row(
        mainAxisAlignment: sininLogic.sininData?.isShowReissue ?? false
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: sininLogic.state.showHeaderItem.mapIndexed((e, index) {
          Color textColor = const Color(0xFFFF804C);
          if (index == 1) {
            textColor = const Color(0xFFFF2323);
          } else if (index == 2) {
            textColor = const Color(0xFF00B3F5);
          }

          return Container(
            width: 90.r,
            // height: 20.r,
            decoration: BoxDecoration(
              // color: stringToColor('3A393C'),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  e.imageName,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 2.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.suffixBeforTitle ?? '',
                      style: TextStyle(color: textColor, fontSize: 10.sp),
                    ),
                    Text(
                      e.prefixBeforTitle ?? '',
                      style: TextStyle(color: textColor, fontSize: 10.sp),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildSininContent() {
    return Container(
      height: 112.r,
      // color: Colors.green,
      margin: EdgeInsets.only(top: 15.r, left: 8.r, right: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: SizedBox(
              width: 44.0 * (sininLogic.state.dayList.length),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                controller: sininLogic.scrollController,
                itemCount: sininLogic.state.dayList.length,
                itemBuilder: (_, index) {
                  return SininDayView(
                    sevenDay: sininLogic.state.dayList[index],
                    showReissue: sininLogic.showReissue,
                    labelState: sininLogic
                        .getSininLabel(sininLogic.state.dayList[index]),
                    lastDayIsSign: getSininLabelState(index),
                    preDayIsSign: getPreSininLabelState(index),
                    index: index + 1,
                    totalCount: sininLogic.state.dayList.length,
                    changed: (sevenDay) {
                      sininLogic.goToReissueSignin(sevenDay);
                    },
                  );
                },
              ),
            ),
          )),
        ],
      ),
    );
  }

  SininLabelState? getPreSininLabelState(int index) {
    if (index == 0) {
      return null;
    }
    return sininLogic.getSininLabel(sininLogic.state.dayList[index - 1]);
  }

  SininLabelState? getSininLabelState(int index) {
    if (index + 1 >= sininLogic.state.dayList.length) {
      return null;
    }
    return sininLogic.getSininLabel(sininLogic.state.dayList[index + 1]);
  }

  //展开查看当月签到
  _buildSigninFootButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.r, top: 10.r),
      height: 20.r,
      width: 100.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFEA3E33),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: GestureDetector(
          onTap: () {
            sininLogic.showCurrentMonthSignin();
          },
          child: Text(
            '查看当月签到',
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          )),
    );
  }

  _buildFootGameView() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 3.r,
              height: 15.r,
              color: Colors.black,
            ),
            const Text(
              ' 大家都在玩 ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ],
        ),
        SizedBox(
          height: 15.r,
        ),
        _buildGridView()
      ],
    );
  }

  _buildGridView() {
    return Builder(builder: (context) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: min(sininLogic.subChildren?.length ?? 0, 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 10.r,
          crossAxisSpacing: 10.r,
        ),
        itemBuilder: (_, int index) {
          // if (sininLogic.subChildren == null ||
          //     sininLogic.subChildren!.isEmpty) {
          //   return SizedBox.shrink();
          // }
          return buildGameItem(sininLogic.subChildren?[index]);
        },
      );
    });
  }

  buildGameItem(SubChildren? subChildren) {
    return GestureDetector(
      onTap: () {
        sininLogic.cardClick(subChildren);
      },
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: DjImage.network(
                subChildren?.image ?? '',
                // width: 280.w,
                // width: 60.r,
                // height: 60.r,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const GFLoader();
                },
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 80.r),
              child: Text(
                subChildren?.nameCn ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
            )
            // Text(subChildren.href!),
          ],
        ),
      ),
    );
  }
}
