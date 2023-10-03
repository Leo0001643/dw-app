import 'package:aone_common/common.dart';
import 'package:app04/theme/image_util.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/activities/controllers/activity_controller.dart';
import 'package:app04/views/activities/person/views/header_view.dart';
import 'package:app04/views/activities/person/views/person_numbers.dart';
import 'package:app04/views/activities/widgets/tabbar_title.dart';
import 'package:app04/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../theme/color_schema.dart';
import '../widgets/youhui_tabbar_title.dart';
import 'controllers/person_controller.dart';

class PersonPage extends GetView<PersonController> {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PersonController());
    return GetBuilder<PersonController>(
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
              title:const Text("会员中心",style: TextStyle(
                fontSize:16,
                color: Color(0xFFFFFFFF)
              ),),
              centerTitle: true,

              leading: const Image(
                width: 25,
                height: 25,
                image: AssetImage(
                  'assets/images/home/state_more.png',
                ),
              ),
              actions:  [
                Container(
                  padding: const EdgeInsets.fromLTRB(0,0,25,0),
                  child: const Image(
                    width: 25,
                    height: 25,
                    image: AssetImage(
                      'assets/images/home/home_searcher.png',
                    ),
                  ),
                ),
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    stringToColor('13805E'),
                    stringToColor('06C285'),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                ),
              )),
          hideBack: true,
          title: 'activity'.tr,
          body:
          Column(
            children: const [
              PersonHeader(),
              PersonNumbers(),
            ],
          ),
        );
      },
    );
  }
}
