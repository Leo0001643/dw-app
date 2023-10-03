import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RechargeAlertView extends StatelessWidget {
  const RechargeAlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      height: 246,
      width: Get.width - 60,
      child: Column(
        children: [
          Container(
            width: Get.width - 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: stringToColor('dae3f2'),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: 46,
            child: Text(
              'VIP充值',
              style: TextStyle(
                  fontSize: 18,
                  color: stringToColor('0b213b'),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 13),
            alignment: Alignment.centerLeft,
            child: Text(
              '添加微信好友转账',
              style: TextStyle(
                  fontSize: 14,
                  color: stringToColor('1f1f1f'),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 28,
                    padding: const EdgeInsets.only(left: 12, right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            width: 1, color: stringToColor('3276f5'))),
                    child: Text(
                      'https://a1ops01.com',
                      style: TextStyle(
                          fontSize: 12,
                          color: stringToColor('3276f5'),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 28,
                      margin: const EdgeInsets.only(left: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: stringToColor('3276f5')),
                      child: const Text(
                        '复制',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            width: Get.width - 80,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(left: 10, top: 18, right: 10),
            height: 36,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/recharge/input_box.png'),
                    fit: BoxFit.fill)),
            child: Drawer(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: TextField(
                style: TextStyle(
                    fontSize: 26,
                    color: stringToColor('1f1f1f'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'VIP充值',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: stringToColor('0b213b', 0.3),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 118,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: stringToColor('0b213b', 0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '取消',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 118,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          stringToColor('429ffe'),
                          stringToColor('2f72f4')
                        ])),
                    child: Text(
                      '确认',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
