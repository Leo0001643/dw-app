import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import '../user_center/controller/user_controller.dart';
import 'message_center_state.dart';

class MessageCenterLogic extends BaseController {
  static MessageCenterLogic get to => Get.find();
  MessageCenterState state = MessageCenterState();
  MessageCenterProvider provider = MessageCenterProvider();

  @override
  Future<void> onInit() async {
    startLoading();
    await initHeaderListr();
    // await getPopNotice();
    // await scrollNotice();
    await getZnxList();
    super.onInit();
    stopLoading();
  }

  @override
  void onClose() async {
    if (Get.isRegistered<UserController>()) {
      UserController.to.factorNeed();
    }
    super.onClose();
  }

  initHeaderListr() async {
    state.headerList.add(Tuple2('全部', state.selIndex == 0));
    state.headerList.add(Tuple2('未读', state.selIndex == 1));
    state.headerList.add(Tuple2('已读', state.selIndex == 2));
  }

  clickItem(int index, String? title, String date, String? desc, int? isHuodong) {
    state.title = title;
    state.date = date;
    state.desc = desc;
    state.isHuodong = isHuodong;
    Get.toNamed(Routes.messageDetail, arguments: index);
  }

  // 首页弹出公告
  Future<void> getPopNotice() async {
    await fetchHandler<NoticeEntity>(
      provider.getPopNotice(),
    ).then((value) => {state.noticeItems?.addAll(value!.items!)});
  }

  // 滚动公告
  Future<void> scrollNotice() async {
    await fetchHandler<ScrollNoticeEntity>(
      provider.scrollNotice(),
    ).then((value) => {state.scrollNoticeItems?.addAll(value!.items!)});
  }

  //站内信息也就是系统信息
  Future<void> getZnxList() async {
    SelectDateDto dto = SelectDateDto(currentPage: 1, currentPageTotal: 1000);
    await fetchHandler<MessageEntity>(
      provider.getZnxList(dto),
    ).then((value) {
      state.messageItems?.clear();
      state.messageItems?.addAll(value!.items!);
    });
  }

  ///全选，
  var checkIds = <String>[].obs;
  var isCheckAll = false.obs;

  void checkAll() {
    isCheckAll.value = !isCheckAll.value;
    checkIds.clear();
    if (isCheckAll.value) {
      state.messageItems?.forEach((item) {
        if (state.selIndex == 0) {
          checkIds.add(item.id.toString());
        } else if (state.selIndex == 1 && item.isRead == 1) {
          checkIds.add(item.id.toString());
        } else if (state.selIndex == 2 && item.isRead != 1) {
          checkIds.add(item.id.toString());
        }
      });
    }
  }

  ///全选，
  Future<void> deleteAll() async {
    if (checkIds.isEmpty) {
      return;
    }
    for (var element in checkIds) {
      deleteMessage(element);
      state.messageItems?.remove(state.messageItems?.firstWhere((it) => it.id.toString() == element));
    }
    SmartDialog.showToast('删除成功');
  }

  Future<void> deleteMessage(String id) async {
    await fetchHandler<GeneralModel>(provider.delMessagge(id), onSuccess: (res) {
      if (res.statusCode == 200) {
        update();
      }
    });
  }

  Future<void> messageRead(String id) async {
    await fetchHandler<GeneralModel>(provider.allMessageRead(id), onSuccess: (res) async {
      if (res.statusCode == 200) {
        await getZnxList();
      }
    });
  }
}
