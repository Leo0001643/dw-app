import 'package:aone_common/common.dart';
import 'package:aone_widget/html_renderer/html_renderer.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/activities/controllers/activity_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:red_task/red_task.dart';
import '../../../app_service.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/dialog/activity_dialog.dart';
import '../widgets/apply_activity_dialog.dart';
import '../widgets/youhui_tabbar_title.dart';
import 'choujiang_record_dialog.dart';
import 'fortune_wheel_page.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ActivityController());

    return GetBuilder<ActivityController>(
      autoRemove: false,
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
              ),
              child: _headerButtonList(),
            ),
          ),
          hideBack: true,
          title: 'activity'.tr,
          body: SafeArea(
            child: _activityList(),
          ),
        );
      },
    );
  }

  _headerButtonList() {
    var state = ActivityController.to.state;
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 10.r),
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // 横向滚动
          itemBuilder: (context, index) {
            return _itemButton(state.activityTypes[index].classNameCn!, index);
          },
          itemCount: state.activityTypes.length,
        ),
      );
    });
  }

  _itemButton(String title, int index) {
    var state = ActivityController.to.state;
    return GestureDetector(
      child: Row(
        children: [
          Wrap(
            direction: Axis.horizontal, //方向
            alignment: WrapAlignment.spaceAround,
            children: [
              Obx(() {
                return YouHuiTabBarTitle(
                  title: title,
                  isCheck: state.tabIndex == index,
                );
              }),
            ],
          ),
        ],
      ),
      onTap: () {
        state.tabIndex = index;
        if (index == 0) {
          controller.onTypeChange(0);
        } else {
          controller.onTypeChange(state.activityTypes[index].id!);
        }
      },
    );
  }

  _activityList() {
    final state = ActivityController.to.state;
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => state.pagingController.refresh(),
      ),
      child: PagedListView(
        physics: const BouncingScrollPhysics(),
        pagingController: state.pagingController,
        padding: EdgeInsets.only(left: 12.r, right: 12.r, top: 10.r),
        builderDelegate: PagedChildBuilderDelegate<ActivityInfo>(
          itemBuilder: (BuildContext context, item, int index) {
            return _activityListItem(item);
          },
          noItemsFoundIndicatorBuilder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'discount.no.data'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }

  _activityListItem(ActivityInfo activityInfo) {
    Rx<ActivityInfo?> detailData = Rx(null);
    ExpandableController expandableController = ExpandableController();
    final ctrl = ActivityController.to;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(242, 245, 248, 1),
      ),
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          hasIcon: false,
        ),
        controller: expandableController,
        header: GestureDetector(
          onTap: () async {
            expandableController.toggle();
            try {
              var res = await ctrl.getActivityDetail(activityInfo.id!,
                  loading: false);
              detailData.value = res;
            } catch (_) {
              rethrow;
            }
          },
          child: Container(
            color: const Color.fromRGBO(242, 245, 248, 1),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  height: (Get.width - 12 * 2.r) * 156 / 704.0,
                  fit: BoxFit.fill,
                  imageUrl: staticImageResolver(activityInfo.qtAppSlmg),
                  errorWidget: (_, text, ___) => const SizedBox.shrink(),
                ),
                if (!activityInfo.qtBiao!.contains('0'))
                  Positioned(
                    right: 0,
                    top: 0,
                    width: 35.r,
                    child: _labels(activityInfo.qtBiao!),
                  )
              ],
            ),
          ),
        ),
        collapsed: const SizedBox.shrink(),
        expanded: Obx(
          () {
            return detailData.value == null
                ? const SizedBox.shrink()
                : Obx(
                    () {
                      return Container(
                        color: AppTheme.primary,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (activityInfo.type == 13)
                                    _drawRecord(activityInfo),
                                  if (activityInfo.type == 6)
                                    _applyAct(activityInfo),
                                  if (activityInfo.type == 19)
                                    _getCommonWidget('red.envelopes'.tr,
                                        RedTaskService.to.onEntryRedTask),
                                ],
                              ),
                            ),
                            Flexible(
                                child: HtmlRenderer(
                              data: detailData.value?.qtAppContent ?? '-',
                              shrinkWrap: true,
                              onLinkTap: (String? url, RenderContext context,
                                  Map<String, String> attributes, element) {
                                if (url != null) {
                                  AppService.to.openUrl(url!);
                                }
                              },
                              style: {
                                'p': Style(
                                  color: Colors.white,
                                ),
                                "table": Style(
                                  width: Width.auto(),
                                  height: Height.auto(),
                                  color: Colors.white,
                                  // border: Border.all(
                                  //     width: 0.5, color: Colors.white)
                                ),
                                "tr": Style(
                                    width: Width.auto(),
                                    height: Height.auto(),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                "th": Style(
                                  width: Width.auto(),
                                  height: Height.auto(),
                                  color: Colors.white,
                                  backgroundColor: Colors.white,
                                ),
                                "td": Style(
                                    width: Width.auto(),
                                    height: Height.auto(),
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4)),
                              },
                            )),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }

  Widget _labels(String qtBiao) {
    if (qtBiao.contains('1')) {
      return Image.asset(
        'assets/images/activity/activity_type_1.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    if (qtBiao.contains('2')) {
      return Image.asset(
        'assets/images/activity/activity_type_3.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    if (qtBiao.contains('3')) {
      return Image.asset(
        'assets/images/activity/activity_type_2.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    return const SizedBox();
  }

  Widget _applyAct(ActivityInfo activityInfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 1, left: 3, right: 3, bottom: 3),
          margin: const EdgeInsets.only(top: 10, right: 10),
          decoration: BoxDecoration(
              color: stringToColor('FD5E24'),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: GestureDetector(
            onTap: () {
              // print(activityInfo.title ?? '');
              if (UserService.to.state.isVisitor) {
                Get.toNamed(Routes.login);
                SmartDialog.showToast('请登录以继续');
                return;
              }
              if (UserService.to.state.isTrial) {
                SmartDialog.showToast('请登录正式账号');
                return;
              }
              Get.dialog(ActivityDialog(
                  title: 'discount.show.apply.title'.tr,
                  child: ApplyActivityDialog(activityInfo: activityInfo)));
            },
            child: Text(
              'discount.show.apply'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }

  Widget _getCommonWidget(String content, void Function() callback) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      padding: const EdgeInsets.only(top: 1, left: 3, right: 3, bottom: 3),
      decoration: BoxDecoration(
          color: stringToColor('FD5E24'),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: GestureDetector(
        onTap: callback,
        child: Center(
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _drawRecord(ActivityInfo info) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(top: 1, left: 3, right: 3, bottom: 3),
            decoration: BoxDecoration(
                color: stringToColor('FD5E24'),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: GestureDetector(
              onTap: () async {
                if (UserService.to.state.isVisitor) {
                  Get.toNamed(Routes.login);
                  return;
                }
                if (UserService.to.state.isTrial) {
                  SmartDialog.showToast('请登录正式账号');
                  return;
                }
                Get.dialog(const ChoujiangRecordDialog(), arguments: info.id!);
              },
              child: Center(
                child: Text(
                  'discount.show.lotteryrecord'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(top: 1, left: 3, right: 3, bottom: 3),
            decoration: BoxDecoration(
                color: stringToColor('FD5E24'),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: GestureDetector(
              onTap: () async {
                Get.put(
                  FortuneWheelService(
                    toFortuneWheelPage: () =>
                        Get.dialog(const FortuneWheelPage(), name: 'dzp'),
                    openCS: () {},
                  ),
                );
                await FortuneWheelService.to.onBeforeEntry();
              },
              child: Center(
                child: Text(
                  'discount.show.luckdraw'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
