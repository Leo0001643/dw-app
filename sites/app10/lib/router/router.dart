/*
 * @Author: your name
 * @Date: 2022-02-23 23:31:38
 * @LastEditTime: 2022-02-25 13:51:10
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /aone_flutter/lib/router/router.dart
 */

import 'package:aone_common/common.dart';
import 'package:app10/views/activities/router.dart';
import 'package:app10/views/authenticate/router.dart';
import 'package:app10/views/games/router.dart';
import 'package:app10/views/general/router.dart';
import 'package:app10/views/user/article/article_page.dart';
import 'package:app10/views/user/user_center/binding/user_binding.dart';
import 'package:app10/views/user/user_center/views/user_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../views/authenticate/widget/register_widget.dart';
import '../views/user/router.dart';

final List<GetPage> routers = [
  ...activitiesRoutes,
  ...authenticateRoutes,
  ...generalRoutes,
  ...gamesRoutes,
  ...userRoutes,
  GetPage(
    name: Routes.article,
    page: () => const ArticlePage(),
    binding: UserBinding(),
  ),
  GetPage(
    name: Routes.userReg,
    page: () => RegisterWidget(),
  ),
];
