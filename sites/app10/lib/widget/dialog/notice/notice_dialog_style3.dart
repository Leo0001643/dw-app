import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/html_renderer/html_renderer.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide ExpansionPanel;
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/theme_scaffold.dart';

class NoticeDialogStyle3 extends StatefulWidget {
  final List<NoticeItems> notices;

  const NoticeDialogStyle3({
    Key? key,
    required this.notices,
  }) : super(key: key);

  @override
  State<NoticeDialogStyle3> createState() => _NoticeDialogStyle3State();
}

class _NoticeDialogStyle3State extends State<NoticeDialogStyle3> {
  int currentIndex = 0;
  bool isChecked = false;
  final double width = 290.r;
  final double height = 376.r;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, -50.r),
          child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color(0xFF3F3C3C),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0.r,
                    height: 39.r,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '公告',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 39.r,
                    bottom: 44.r,
                    child: Container(
                      color: const Color(0xffF0F1F3),
                      child: ListView(
                        children: widget.notices.map((e) {
                          return ExpandableNotifier(
                            initialExpanded: true,
                            child: ScrollOnExpand(
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  hasIcon: false,
                                ),
                                header: ExpandableButton(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Get.to(NoticeStyle3DetailView(
                                          title: e.title!,
                                          content: e.body!,
                                          isBk: e.isBk!));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF3F3C3C)))),
                                      height: 41.r,
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 14.r,
                                          ),
                                          Image.asset(
                                            'assets/images/home/home_notice_tips.png',
                                            width: 15.r,
                                          ),
                                          SizedBox(
                                            width: 7.5.r,
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: (290 - 80).r),
                                            child: Text(
                                              e.title ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    31, 31, 31, 1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 20.r,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 12.r,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Container(),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    height: 44.r,
                    bottom: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          '我知道了',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class NoticeStyle3DetailView extends StatelessWidget {
  final String title;
  final String content;
  final int isBk;

  const NoticeStyle3DetailView({
    Key? key,
    required this.title,
    required this.content,
    required this.isBk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      backgroundColor: Colors.black,
      title: isBk == 1 ? title : "",
      body: LayoutBuilder(builder: (constraints, context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(minHeight: context.maxHeight - 100),
                child: HtmlRenderer(
                  data: content,
                  style: {
                    'p': Style(
                      color: Colors.white,
                    ),
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0XFFA98A67),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "查看更多",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// import 'package:aone_common/data/model/entities/notice/Items.dart';
// import 'package:aone_widget/aone_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart' hide ExpansionPanel;
// import 'package:flutter_html/style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// ///首页，列表弹窗
// class NoticeDialogStyle3 extends StatefulWidget {
//   final List<NoticeItems> notices;
//
//   const NoticeDialogStyle3({
//     Key? key,
//     required this.notices,
//   }) : super(key: key);
//
//   @override
//   State<NoticeDialogStyle3> createState() => _NoticeDialogStyle3State();
// }
//
// class _NoticeDialogStyle3State extends State<NoticeDialogStyle3> {
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     double contentHeight = 348.r;
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//             width: 300.w,
//             height: contentHeight,
//             padding: EdgeInsets.symmetric(horizontal: 15.r),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   "assets/images/home/pop_bg.png",
//                 ),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 15.r,
//                 ),
//                 SizedBox(
//                   height: 40.r,
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 33.r,
//                           width: 33.r,
//                           child: SvgPicture.asset(
//                             'assets/images/home/pop_tip.svg',
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5.r,
//                         ),
//                         Text(
//                           '温馨提示',
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.r,
//                 ),
//                 SizedBox(
//                   height: contentHeight - 80.r,
//                   child: ListView(
//                     children: widget.notices.map((e) {
//                       return ExpandableNotifier(
//                         initialExpanded: true,
//                         child: ScrollOnExpand(
//                           child: ExpandablePanel(
//                             theme: const ExpandableThemeData(
//                               hasIcon: false,
//                             ),
//                             header: ExpandableButton(
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             width: 1, color: Colors.grey))),
//                                 height: 41.r,
//                                 child: Row(
//                                   children: <Widget>[
//                                     SizedBox(
//                                       width: 14.r,
//                                     ),
//                                     Container(
//                                       constraints: BoxConstraints(
//                                           maxWidth: (290 - 80).r),
//                                       child: Text(
//                                         e.title ?? '',
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: const TextStyle(
//                                           color: Color.fromRGBO(31, 31, 31, 1),
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     Icon(
//                                       Icons.arrow_forward_ios_sharp,
//                                       size: 20.r,
//                                       color: Colors.grey,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             collapsed: HtmlRenderer(
//                               data: e.body,
//                             ),
//                             expanded: Container(),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 )
//               ],
//             )),
//         Transform.translate(
//           offset: Offset(0, ((contentHeight / 2) + 40).r),
//           child: GestureDetector(
//             onTap: Get.back,
//             child: Image.asset(
//               'assets/images/home/dialog_close.png',
//               color: Colors.white,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
