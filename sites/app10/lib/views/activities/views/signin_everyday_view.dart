import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_state.dart';
import 'package:aone_common/data/data.dart';
import 'package:aone_common/router/router.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';

import '../../../tab/controllers/main_tabbar_controller.dart';
import '../../../theme/color_schema.dart';
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
        backgroundColor: AppTheme.primaryOne,
        // backgroundColor: Colors.white,
        actions: _titleBtnViews(),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       'assets/images/user/user_center_bg.png',
          //     ),
          //     alignment: Alignment.topCenter,
          //     fit: BoxFit.fitWidth,
          //   ),
          // ),
          child: SingleChildScrollView(
            child: Obx(
              () {
                return Stack(children: [
                  Container(
                    height: 1.sh,
                    width: 1.sw,
                    margin: EdgeInsets.only(top: 150),
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
                                    'assets/images/activity/signin_more_fuli.png'),
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
        ),
        // bottomNavigationBar: getBottomNavigationBar(context),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: Colors.white,
        //   child: getFloatingButton(),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                'assets/images/activity/signin_wenhao.svg',
                width: 20,
                height: 20,
              ),
            ],
          ),
        )));
    return _list;
  }

  _buildTopView() {
    return GestureDetector(
      onTap: () {
        sininLogic.goToSignin();
      },
      child: Container(
        width: 130.r,
        height: 44.r,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/activity/signin_now_bg.png'))
            // gradient: LinearGradient(colors: [
            //   stringToColor('13805E'),
            //   stringToColor('06C285'),
            // ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            // borderRadius: BorderRadius.circular(15.r),
            ),
        margin: EdgeInsets.only(top: 10.r, bottom: 20.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SvgPicture.asset('assets/images/activity/signin_left_icon.svg'),
            Text(
              sininLogic.sininData?.todayIsQiandao ?? false
                  ? 'sinin.success'.tr
                  : 'sinin.goto.sinin_now'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )
            // wrapper: ,
          ],
        ),
      ),
    );
  }

  _buildSigninContentView() {
    return Container(
      width: Get.width - 20.r,
      margin: EdgeInsets.only(bottom: 5.r),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.23),
              blurRadius: 2.0,
            ),
          ],
          // color: Colors.yellow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
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
      decoration: BoxDecoration(
        // color: stringToColor('3A393C'),
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(onTap: () {
        sininLogic.showCurrentMonthSignin();
      }, child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '查看当月签到',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            const SizedBox(
              width: 2.5,
            ),
            SvgPicture.asset(
              sininLogic.showMore
                  ? 'assets/images/activity/signin_show_up.svg'
                  : 'assets/images/activity/signin_show_down.svg',
              fit: BoxFit.fill,
              color: stringToColor('666666'),
            ),
          ],
        );
      })),
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
            // Image.asset(
            //   'assets/images/activity/activity_sign_line_left.png',
            //   width: 84,
            //   color: Colors.white,
            // ),
            const Text(
              ' 大家都在玩 ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            // Image.asset(
            //   'assets/images/activity/activity_sign_line_right.png',
            //   width: 84,
            //   color: Colors.white,
            // ),
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
        itemCount: sininLogic.subChildren?.length,
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
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.black,
    //     borderRadius: BorderRadius.all(Radius.circular(4.r)),
    //     // image: DecorationImage(
    //     //     image: NetworkImage(
    //     //       ctrl.navConfigList[this.index].subChildren![index].image ?? "",
    //     //     ),
    //     //     fit: BoxFit.fill)
    //   ),
    //   child: Stack(alignment: Alignment.centerLeft, children: [
    //     Positioned(top: 6.w, bottom: 6.w, left: 6.w, child: Container()),
    //     Positioned(
    //       top: 0.w,
    //       right: 0.w,
    //       child: DjImage.asset(
    //         subChildren.image ?? '',
    //         width: 40.r,
    //         height: 40.r,
    //         fit: BoxFit.fill,
    //       ),
    //     )
    //   ]),
    // );

    return GestureDetector(
      onTap: () {
        sininLogic.cardClick(subChildren);
      },
      child: Container(
        // width: (Get.width - 20) / 2,
        // height: 50.r,
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
