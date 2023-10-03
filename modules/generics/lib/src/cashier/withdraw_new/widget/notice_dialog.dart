import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/html_renderer/html_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/dj_image.dart';

class NoticeDialog extends StatelessWidget {
  final List<NoticeItems> notices;

  NoticeDialog({Key? key, required this.notices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('1111222223333');
    AnnouncementBean announcementBean=AnnouncementBean.fromJson(notices[0].announcementTheStyle);
    var type =announcementBean.mobile;
    if(type ==1){
      return styleThree();
    } else if(type ==2){
      return styleOne();
    }
    return styleThree();
  }

   styleOne(){
    for (var i = 0; i < notices.length; i++) {
      noticeClick1(i);
    }
  }
  Widget styleTwo(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 290,
                height: 410,
                padding: const EdgeInsets.only(
                    top: 18, left: 11, bottom: 18, right: 11),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                    AssetImage('assets/images/home/home_notice_ground.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  left: 30,
                  right: 30,
                  top: 170,
                  bottom: 48,
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    children: _buildNoticelist(),
                  )),
              Positioned(
                  bottom: 10,
                  child: Container(
                    width: 135,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(Get.context!).pop();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: const Text(
                        '我知道了',
                        style:
                        TextStyle(color: Color.fromRGBO(25, 118, 245, 1)),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget styleThree(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 290,
                height: 410,
                padding: const EdgeInsets.only(
                    top: 18, left: 11, bottom: 18, right: 11),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                    AssetImage('assets/images/home/home_notice_ground.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  left: 30,
                  right: 30,
                  top: 170,
                  bottom: 48,
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    children: _buildNoticelist(),
                  )),
              Positioned(
                  bottom: 10,
                  child: Container(
                    width: 135,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(Get.context!).pop();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: const Text(
                        '我知道了',
                        style:
                        TextStyle(color: Color.fromRGBO(25, 118, 245, 1)),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
  _buildNoticelist() {
    List<Widget> returnList = [];
    for (var i = 0; i < notices.length; i++) {
      returnList.add(_noticeItem(i));
    }
    return returnList;
  }

  Future<void> noticeClick1(int index) async {
    await Get.defaultDialog(
        content: Container(
            width: 300.w,
            height: 300.w,
            child: Column(
              children: [
                SizedBox(
                  height: 40.r,
                ),
                Text(
                  notices[index].title!,
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 180.r,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20.r, right: 20.r, bottom: 120.r, top: 10.r),
                      child: HtmlRenderer(
                        data: notices[index].body!,
                        style: {
                          'p': Style(
                            color: Colors.white,
                          ),
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
        confirm: GestureDetector(
          child: DjImage.asset(
            'assets/images/home/notice_close.png',
            width: 20.w,
            height: 20.w,
            // fit: BoxFit.fill,
          ),
          onTap: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent);
  }

  void noticeClick2(int index) {
    Get.defaultDialog(
        content: Container(
          padding:
              EdgeInsets.only(left: 10.r, right: 10.r, bottom: 20.r, top: 20.r),
          width: 250.r,
          height: 300.r,
          child: Container(
            height: 180.r,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(
                    left: 0.r, right: 0.r, bottom: 20.r, top: 10.r),
                child: HtmlRenderer(
                  data: notices[index].body!,
                  style: {
                    'p': Style(
                      color: Colors.white,
                    ),
                  },
                ),
              ),
            ),
          ),
        ),
        confirm: GestureDetector(
          child: DjImage.asset(
            'assets/images/home/notice_close.png',
            width: 20.w,
            height: 20.w,
            // fit: BoxFit.fill,
          ),
          onTap: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent);
  }

  void noticeClick3(int index) {
    Get.dialog(Center(
      child: Container(
          width: 300.w,
          height: 300.w,
          child: Column(
            children: [
              SizedBox(
                height: 30.r,
              ),
              Text(
                notices[index].title!,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 160.r,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20.r, right: 20.r, bottom: 120.r, top: 10.r),
                    child: HtmlRenderer(
                      data: notices[index].body!,
                      style: {
                        'p': Style(
                          color: Colors.white,
                        ),
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: 135,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(Get.context!).pop();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  child: const Text(
                    '我知道了',
                    style: TextStyle(color: Color.fromRGBO(25, 118, 245, 1)),
                  ),
                ),
              ),
            ],
          )),
    ));
  }

  Widget _noticeItem(int index) {
    return GestureDetector(
      onTap: () async {
        // var typeTag = notices[index].announcementTheStyle;
        var typeTag=1;
        if (typeTag == 1) {
          noticeClick3(index);
          return;
        } else if (typeTag == 2) {
          noticeClick2(index);
          return;
        } else if (typeTag == 3) {
          noticeClick1(index);
          return;
        }
      },
      child: Container(
        height: 32,
        margin: const EdgeInsets.only(bottom: 7),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/home/home_notice_listbg_new.png'))),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 14,
            ),
            Image.asset('assets/images/home/home_notice_hot.png'),
            const SizedBox(
              width: 7.5,
            ),
            Text(
              notices[index].title!,
              style: TextStyle(
                  color: Color.fromRGBO(31, 31, 31, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/user/next_image.png',
              width: 6.4,
              height: 11.4,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
