import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../cashier/utils/theme_scaffold.dart';
import '../controllers/game_search_controller.dart';

class GameSearchView extends GetView<GameSearchController> {
  const GameSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AoneAppTheme.appTheme.searchAppBarIconColor,
          ),
        ),
        flexibleSpace: Container(
          decoration: AoneAppTheme.appTheme.searchAppBarDecoration ?? AoneAppTheme.appTheme.gameAppBarDecoration,
        ),
        title: Container(
          padding: EdgeInsets.only(right: 30.w),
          alignment: Alignment.center,
          height: 26.r,
          decoration: AoneAppTheme.appTheme.searchAppBarFieldDecoration ?? AoneAppTheme.appTheme.gameAppBarDecoration,
          width: double.infinity,
          child: TextField(
            style: AoneAppTheme.appTheme.searchAppBarFieldTextStyle ??
                TextStyle(
                  fontSize: 12.w,
                ),
            onChanged: (val) => controller.searchValue = val,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 20.w, top: 0.r, bottom: 0.r),
                // iconColor: AppTheme.cardUnSelectColor,
                hintText: "请输入需要搜索的游戏名称",
                hintStyle: AoneAppTheme.appTheme.searchAppBarFieldTextStyle ?? TextStyle(fontSize: 12.w)),
          ),
        ),
      ),
      body: Container(color: AoneAppTheme.appTheme.searchBgColor ?? Colors.white, child: _pageStateBuilder()),
    );
  }

  Widget _pageStateBuilder() {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return Container(
          color: AoneAppTheme.appTheme.searchItemBgColor ?? Colors.white,
          child: const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
              valueColor: AlwaysStoppedAnimation(
                // AppTheme.primary,
                Colors.blue,
              ),
            ),
          ),
        );
      }
      return Column(
        children: [
          if (controller.searchValue == '') _hotSearch(),
          if (controller.searchValue != '') controller.searchResult.isEmpty ? _notData() : _resultSearch(),
        ],
      );
    });
  }

  Widget _notData() {
    return Expanded(
      child: Container(
        color: AoneAppTheme.appTheme.searchBgColor ?? Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/game/no_data.png', width: 288, height: 201, package: 'generics'),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "未找到符合相关条件的游戏",
                  style: AoneAppTheme.appTheme.searchAppBarFieldTextStyle?.copyWith(fontSize: 16) ??
                      TextStyle(
                        fontSize: 12.w,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _hotSearch() {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: controller.hotSearchGames
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: _itemWrap(element.gameTag!, element.nameCn ?? ''),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _resultSearch() {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: controller.searchResult
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: _itemWrap(element.gameTag!, element.name ?? ''),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _itemWrap(String gameTag, String nameCn) {
    return Container(
        width: ScreenUtil().screenWidth / 3,
        height: 45.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
        decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: AoneAppTheme.appTheme.primary ?? const Color(0xffCCCCCC),
            ),
            color: AoneAppTheme.appTheme.searchItemBgColor ?? Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 25.w,
              height: 25.w,
              child: Image.network(
                staticImageResolver(
                  '/static/comm/gameImage/wap/140-104/' + gameTag + '.png',
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                nameCn,
                style: TextStyle(
                  fontSize: 14.w,
                  color: AoneAppTheme.appTheme.searchItemFontColor ?? Colors.black,
                  height: 18 / 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ));
  }
}
