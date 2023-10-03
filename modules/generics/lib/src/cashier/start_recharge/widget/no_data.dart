import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoData extends StatelessWidget {
  final String title;
  final String? img;
  final TextStyle? style;

  const NoData({Key? key, required this.title, this.img, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("----->info ${img}");
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          img == null
              ? Image.asset(
                  'assets/images/user/icon_recharge_aaa.png',
                  width: 200,
                  height: 179,
                  package: 'generics',
                )
              : Image.asset(
                  img ?? "",
                  width: 200,
                  height: 179,
                  //??? 这个好像没用 我删除了 pieces
                  // package: 'generics',
                ),
          Text(
            title,
            style: style,
          ),
        ],
      ),
    );
  }
}
