import 'package:aone_common/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/strong_activity_controller.dart';

class StrongPopGameDialog extends GetView<StrongActivityController> {
  final RxInt _index = 0.obs;

  final List<GameWapPopItems> items;
  final VoidCallback onClose;

  StrongPopGameDialog({
    Key? key,
    required this.items,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current;
    var swiperControl = const SwiperControl();
    current = Swiper(
      itemBuilder: (BuildContext context, int index) {
        var item2 = items[index];
        return GestureDetector(
          onTap: () {
            if (item2.url!.isNotEmpty) {
              Get.toNamed(Routes.webPage, arguments: WebData(item2.url!));
            }
          },
          child: _ItemWidget(
            item: item2,
          ),
        );
      },
      itemCount: items.length,
      // pagination: new SwiperPagination(),
      autoplayDelay: 5000,
      autoplay: true,
      control: swiperControl,
      onIndexChanged: (index) {
        _index.value = index;
      },
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(clipBehavior: Clip.none, children: <Widget>[
            SizedBox(
              width: Get.width,
              height: Get.width * 1.1,
              child: current,
            ),
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assets/images/common/ad_close.png',
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Checkbox(
                  value: controller.isTodayNoDisplayChecked,
                  onChanged: (checked) {
                    controller.isTodayNoDisplayChecked = checked!;
                  },
                  fillColor: MaterialStateProperty.all(Colors.white),
                  checkColor: Colors.red,
                );
              }),
              Text(
                "strong_activity_don_t_show_today".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final GameWapPopItems item;

  @override
  Widget build(BuildContext context) {
    Widget current;
    current = CachedNetworkImage(
      height: 500.w,
      fit: BoxFit.fill,
      imageUrl: staticImageResolver(item.img),
      errorWidget: (_, __, ___) => const SizedBox.shrink(),
    );
    return current;
  }
}
