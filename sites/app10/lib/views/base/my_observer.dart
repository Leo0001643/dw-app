// import 'package:aone_common/common.dart';
// import 'package:app10/tab/controllers/main_tabbar_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../general/controllers/home_page_controller.dart';
//
// class MyObserver extends NavigatorObserver {
//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPop(route, previousRoute);
//     if (HomePageController.isHideHomeNotice) {
//       return;
//     }
//
//     bool isNext = PopupService.to.currentStyleNum == 3 &&
//         !HomePageController.isHideHomeNotice;
//     if (isNext != true) return;
//
//     // print(
//     //     'didPop.previousRoute: ${previousRoute?.settings.name},  route: ${route?.settings.name}');
//
//     bool isMain = previousRoute?.settings.name == Routes.main;
//     bool isNotDialog = route.settings.name != null;
//     if (Get.isRegistered<MainTabbarController>()) {
//       bool isHome = MainTabbarController.to.selectIndex == 0;
//       bool isNotGame = route.settings.name != Routes.gameInit;
//
//       if (isMain && isNotDialog && isHome && isNotGame) {
//         Future.delayed(const Duration(seconds: 1), () {
//           PopupService.to
//               .triggerPopup(routeName: Routes.home, appSiteTag: 'app10');
//         });
//       }
//     }
//   }
// }
