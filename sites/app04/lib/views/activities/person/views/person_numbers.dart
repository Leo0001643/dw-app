import 'package:aone_common/utils/colors.dart';
import 'package:app04/theme/image_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonNumbers extends StatelessWidget {
  const PersonNumbers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            stringToColor('13805E'),
            stringToColor('06C285'),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        height: 185.r,
        alignment: Alignment.center,
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 65.r,
                height: 65.r,
                margin: EdgeInsets.only(left: 17.r, top: 2.5.r),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://static.cccrrc.com/static/site-qt/h09_wap/153/img/usertop.png',
                    )),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "会员账号:",
                        style: TextStyle(
                          color: Color(0x88F8F1F1),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "ceshi911",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "洗码量:   ",
                        style: TextStyle(
                          color: Color(0x88F8F1F1),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "34224",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "余额:  ",
                        style: TextStyle(
                          color: Color(0x88F8F1F1),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "￥2313213.54",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 168.r,
            height: 45.r,
            alignment: const Alignment(0, 0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: Row(
              children: const [
                SizedBox(
                  width: 22,
                ),
                Image(
                  width: 25,
                  height: 25,
                  image: AssetImage(
                    'assets/images/user/person_icon_refresh.png',
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Image(
                  width: 85,
                  height: 30,
                  image: AssetImage(
                    'assets/images/user/person_yue_refresh.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 11.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Image(
                width: 93,
                height: 31,
                image: AssetImage(
                  'assets/images/user/person_item_order.png',
                ),
              ),
              Image(
                width: 93,
                height: 31,
                image: AssetImage(
                  'assets/images/user/person_item_charge.png',
                ),
              ),
              Image(
                width: 93,
                height: 31,
                image: AssetImage(
                  'assets/images/user/person_item_deposity.png',
                ),
              ),
            ],
          )
        ]));
  }
}
