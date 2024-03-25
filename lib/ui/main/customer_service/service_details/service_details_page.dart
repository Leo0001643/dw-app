import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

import '../../../../app/routes.dart';
import '../../../bean/html_event.dart';
import 'service_details_logic.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  final logic = Get.find<ServiceDetailsLogic>();
  final state = Get.find<ServiceDetailsLogic>().state;

  @override
  void initState() {
    state.detail = Get.arguments;
    state.title.value = state.detail.name.em();
    super.initState();
    // print("====== isChat 》${state.detail.toJson()}");
  }

  @override
  void dispose() {
    Get.delete<ServiceDetailsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      backgroundColor: ColorX.cardBg5(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageX.kefudetail),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 213.h,
                child: WidgetUtils().buildRxAppBar(state.title, msg: true, bgColor: Colors.transparent,scaffoldKey: state.scaffoldKey),
              ),
              Container(
                margin: EdgeInsets.only(top: 193.h),
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: state.detail.custerServers
                              ?.map((e) => buildCategaryItem(
                                  e, state.detail.custerServers!.indexOf(e)))
                              .toList() ??
                          [],
                    ),
                    // buildCategaryItem("客服小强","Johnny999",ImageX.icon_wechat, 0),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 1),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 2),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 3),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        Intr().wenxintishi_fuzhi,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorX.text586(),
                            height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Center(
                      child: WidgetUtils().buildElevatedButton(
                          Intr().fanhui, 131.w, 40.h,
                          bg: ColorX.cardBg3(),
                          textColor: ColorX.text0917(), onPressed: () {
                        Navigator.of(context).pop();
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategaryItem(CustomerServiceCusterServers server, int i) {


    var image = "${server.url.em()}${server.image.em()}".trim();
    if(image.isEmpty){
      switch(state.detail.type){
        case "twitter":
          image = ImageX.icon_twitter;
          break;
        case "yuyin":
          image = ImageX.icon_voice;
          break;
        case "skype":
          image = ImageX.icon_skype;
          break;
        case "weixin":
          image = ImageX.icon_wechat;
          break;
        case "facebook":
          image = ImageX.icon_facebook;
          break;
        case "telegram":
          image = ImageX.icon_telegram;
          break;
        case "zaixian":
          image = ImageX.icon_online;
          break;
      }
    }
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorX.cardBg3(),
            borderRadius: BorderRadius.circular(10.r),
            // image: DecorationImage(image: AssetImage(ImageX.bg_customer),fit: BoxFit.fill),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 72.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: WidgetUtils().buildImage(image, 36.r, 36.r,fit: BoxFit.cover,placeholder: true),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    server.name.em(),
                    style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    server.number.em(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorX.text0917(),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {
                  if(state.detail.isChat == true){
                    Get.toNamed(Routes.html,arguments: HtmlEvent(data: "http://soptj9qq.com/m/www.baidu.com",isHtmlData: false,pageTitle: ""));
                  }else{
                    WidgetUtils().clickCopy(server.number.em());
                  }
                },
                child: Text(
                  (state.detail.isChat == true)
                      ? Intr().nowChat
                      : Intr().dianjifuzhi,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorX.text0917(),
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
