import 'package:aone_common/common.dart';
import 'package:app10/views/activities/bindings/activity_detail_binding.dart';
import 'package:app10/views/activities/bindings/signin_everyday_binding.dart';
import 'package:app10/views/activities/views/preferential_view.dart';
import 'package:app10/views/activities/views/signin_everyday_view.dart';
import 'package:app10/views/activities/views/vip_center_view.dart';

import 'package:get/get.dart';

import 'package:generics/generics.dart';
import 'bindings/activity_binding.dart';
import 'bindings/activity_center_binding.dart';
import 'bindings/preferential_binding.dart';
import 'bindings/tack_center_binding.dart';
import 'bindings/vip_center_binding.dart';
import 'views/activity_center_view.dart';
import 'views/activity_detail.dart';
import 'views/activity_view.dart';
import 'views/tack_center_view.dart';
import 'package:red_task/red_task.dart';

final List<GetPage> activitiesRoutes = [
  //优惠中心
  GetPage(
    name: Routes.welfareCenter,
    page: () => const ActivityCenterView(),
    binding: ActivityCenterBinding(),
  ),
  //优惠活动详情
  GetPage(
    name: Routes.activityDetail,
    page: () => const ActivityDetail(),
    binding: ActivityDetailBinding(),
  ),

  //投注返水
  GetPage(
    name: Routes.betBackWater,
    page: () => BetBackwaterHistoryPage(),
    binding: BetBackwaterBinding(),
  ),

  //优惠活动
  GetPage(
    name: Routes.activity,
    page: () => const ActivityView(),
    binding: ActivityBinding(),
  ),
  //任务中心
  GetPage(
    name: Routes.taskCenter,
    page: () => const TackCenterView(),
    binding: TackCenterBinding(),
  ),
  //红包展示页
  GetPage(
    name: Routes.grabRed,
    page: () => const PortraitRedTaskPage(),
    // binding: TackCenterBinding(),
  ),

  //签到页
  GetPage(
    name: Routes.signCenter,
    page: () => SigninView(),
    binding: SigninEverydayBinding(),
  ),
  //Vip中心
  GetPage(
    name: Routes.vipCenter,
    page: () => const VipCenterView(),
    binding: VipCenterBinding(),
  ),
  //我的优惠
  GetPage(
    name: Routes.myPreferential,
    page: () => PreferentialView(),
    binding: PreferentialBinding(),
  ),
];
