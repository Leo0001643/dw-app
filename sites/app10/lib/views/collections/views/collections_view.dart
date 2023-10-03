import 'package:aone_common/common.dart';
import 'package:aone_common/utils/responsive/responsive.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/no_data.dart';
import '../controllers/collections_controller.dart';
import 'collection_item.dart';

class CollectionsView extends GetView<CollectionsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionsController>(builder: (_) {
      return ThemeScaffold(
        appBar: AppBar(
          title: Text(
            '收藏',
            style: TextStyle(
              fontSize: 18.w,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff0C0C0C),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Obx(() {
              if (controller.state.favoriteList.isEmpty) {
                return _noData();
              } else {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.w),
                    child: GridView.builder(
                      itemCount: controller.state.favoriteList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: CollectionItem(
                              controller.state.favoriteList[index]),
                          onTap: () {
                            onBeforeGameInit(
                              onGameParams:
                                  controller.state.favoriteList[index],
                            );
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 100 / 140,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 15.w,
                        crossAxisCount: ResponsiveValue<int>({
                              smallLandscapeScreenScope: 4,
                              largeLandscapeScreenScope: 3,
                            }).resolve(context) ??
                            4,
                      ),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      );
    });
  }

  Widget _noData() {
    return Container(
        margin: EdgeInsets.only(top: 183.w), child: NoData(title: '暂无收藏记录'));
  }
}
