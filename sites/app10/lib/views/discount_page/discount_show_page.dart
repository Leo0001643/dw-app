import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widget/dialog/base_dialog.dart';
import 'discount_apply_page.dart';

class DisCountShow extends StatelessWidget {
  final ActivityInfo? activityInfo;

  const DisCountShow({Key? key, this.activityInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(activityInfo?.qtAppContent ?? '空');
    return Center(
      child: Column(
        children: [
          if (activityInfo?.type == 6) _applyAct(),
          if (activityInfo?.type == 13) _drawRecord(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController controller) {
                  controller.loadHtmlString(activityInfo?.qtAppContent ?? '-');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _applyAct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
            onPressed: () {
              print(activityInfo?.title ?? '');
              Get.dialog(
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: BaseDialog(
                    title: 'discount.show.apply.title'.tr,
                    child: DiscountApplyShow(
                      activityInfo: activityInfo,
                    ),
                  ),
                ),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(top: 0, bottom: 0, left: 7.5, right: 7.5),
              ),
            ),
            child: Text(
              'discount.show.apply'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        )
      ],
    );
  }

  Widget _drawRecord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
            onPressed: () async {
              await FortuneWheelService.to.onBeforeEntry();
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    top: 0, bottom: 0, left: 7.5, right: 7.5))),
            child: Text(
              'discount.show.lotteryrecord'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
            onPressed: () async {
              await FortuneWheelService.to.onBeforeEntry();
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    top: 0, bottom: 0, left: 7.5, right: 7.5))),
            child: Text(
              'discount.show.luckdraw'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
