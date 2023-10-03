import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'message_center_state.dart';

class MessageCenterLogic extends BaseController {
  static MessageCenterLogic get to => Get.find();
  MessageCenterState state = MessageCenterState();

  MessageCenterProvider provider = MessageCenterProvider();

  @override
  Future<void> onInit() async {
    if (UserService.to.state.isTrial) return;
    startLoading();
    await initHeaderListr();
    // await getPopNotice();
    // await scrollNotice();
    await getZnxList();
    super.onInit();
    stopLoading();
  }

  initHeaderListr() async {
    state.headerList.add(Tuple2('全部', state.selIndex == 0));
    state.headerList.add(Tuple2('未读', state.selIndex == 1));
    state.headerList.add(Tuple2('已读', state.selIndex == 2));
  }

  clickItem(
      int index, String? title, String date, String? desc, int? isHuodong) {
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
    SelectDateDto dto = SelectDateDto(currentPage: 1, currentPageTotal: 20);
    await fetchHandler<MessageEntity>(
      provider.getZnxList(dto),
    ).then((value) {
      state.messageItems?.clear();
      state.messageItems?.addAll(value!.items!);
      RxList<MessageItems>? unreadItems = RxList.empty();
      RxList<MessageItems>? readedItems = RxList.empty();
      for (MessageItems item in value!.items!) {
        if (item.isRead == 1) {
          unreadItems.add(item);
        } else {
          readedItems.add(item);
        }
      }
      state.unreadMessageItems?.clear();
      state.readedMessageItems?.clear();
      state.unreadMessageItems?.addAll(unreadItems);
      state.readedMessageItems?.addAll(readedItems);
    });
  }

  Future<void> deleteMessage(String id, int index) async {
    await fetchHandler<GeneralModel>(provider.delMessagge(id),
        onSuccess: (res) {
      if (res.statusCode == 200) {
        SmartDialog.showToast(res.message ?? '删除成功');
        state.messageItems?.remove(state.messageItems![index]);
        update();
      }
    });
  }

  Future<void> messageRead(String id) async {
    await fetchHandler<GeneralModel>(provider.allMessageRead(id),
        onSuccess: (res) async {
      if (res.statusCode == 200) {
        await getZnxList();
      }
    });
  }
}
