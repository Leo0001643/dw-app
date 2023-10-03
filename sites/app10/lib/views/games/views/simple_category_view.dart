import 'package:aone_common/common.dart';
import 'package:aone_widget/network_image/network_image.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/color_schema.dart';
import '../../../widget/misc/dj_image.dart';

class SimpleCategoryView extends StatefulWidget {
  final int index;
  const SimpleCategoryView(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  State<SimpleCategoryView> createState() => _SimpleCategoryViewState();
}

class _SimpleCategoryViewState extends State<SimpleCategoryView> {
  late final Navconfig _navItem;
  int _selectedMenuIndex = 0;
  final PageController _pageCtrl = PageController();
  final ScrollController _menuCtrl = ScrollController();

  bool _isFish = false;

  @override
  void initState() {
    super.initState();
    _navItem = HomePageController.to.navConfigListCopy[widget.index];
    _isFish = _navItem.isYs == 'fish';

    if (!_isFish) {
      _pageCtrl.addListener(() {
        int? page = _pageCtrl.page?.round();
        if (_selectedMenuIndex != page) {
          setState(() {
            _selectedMenuIndex = page!;
          });
          _menuCtrl.animateTo((Get.width / 4) * _selectedMenuIndex,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _navItem.subChildren?.forEach((element) {
      print(element.gameTag);
    });

    return ThemeScaffold(
        title: _navItem.nameCn,
        body: Container(
          color: AppTheme.primaryBg,
          child: _isFish ? _fishView() : _normalView(),
        ));
  }

  _normalView() {
    return Column(
      children: [
        SizedBox(
          height: 10.r,
        ),
        SizedBox(
          height: 80.r,
          child: ListView.builder(
              controller: _menuCtrl,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              scrollDirection: Axis.horizontal,
              itemCount: _navItem.subChildren?.length,
              itemBuilder: (_, index) {
                final SubChildren item = _navItem.subChildren![index];

                print('图片地址 == ${item.image}');
                bool isSelected = index == _selectedMenuIndex;
                String img = isSelected
                    ? 'category_menu_bg.png'
                    : 'category_menu_bg_black.png';
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  child: GestureDetector(
                    onTap: () {
                      if (index != _selectedMenuIndex) {
                        if (mounted) {
                          setState(() {
                            _selectedMenuIndex = index;
                          });
                          _pageCtrl.jumpToPage(index);
                          // _menuCtrl.jumpTo(100.r * index);
                        }
                      }
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/game_init/category_menu_bg_line.png',
                          width: 80.r,
                        ),
                        Positioned(
                          left: 2.r,
                          top: 2.r,
                          child: Image.asset(
                            'assets/images/game_init/$img',
                            width: 76.r,
                            height: 76.r,
                          ),
                        ),
                        Positioned(
                          left: 10.r,
                          top: 4.r,
                          right: 10.r,
                          height: 74.r,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 54.r,
                                width: 54.r,
                                child: 
                                DjImage.network(
                                  item.image?.trim() ?? '',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Text(item.nameCn ?? '',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? const Color(0xffF5DDA5)
                                          : const Color(0xFF776E51))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: PageView.builder(
              controller: _pageCtrl,
              itemCount: _navItem.subChildren?.length,
              itemBuilder: (_, int index) {
                SubChildren item = _navItem.subChildren![index];
                return GestureDetector(
                  onTap: () {
                    onBeforeGameInit(onGameParams: item);
                  },
                  child: DjImage.asset(
                    'assets/images/game_init/${item.gameTag}.png',
                    fit: BoxFit.fitWidth,
                  ),
                );
              }),
        ),
      ],
    );
  }

  _fishView() {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 15.r,
        right: 15.r,
      ),
      itemCount: _navItem.subChildren?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.r,
        mainAxisSpacing: 15.r,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (BuildContext context, int index) {
        SubChildren? item = _navItem.subChildren?[index];
        return Center(
          child: GestureDetector(
            onTap: () {
              onBeforeGameInit(onGameParams: item, onCategoryTypes: [2, 6]);
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppTheme.gameCardColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      child: DjImage.network(
                    item?.image ?? '',
                    width: 145.r,
                    height: 145.r,
                    fit: BoxFit.fill,
                  )),
                  Text(
                    item?.nameCn ?? '',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
