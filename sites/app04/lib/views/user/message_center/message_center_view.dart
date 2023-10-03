import 'package:aone_common/data/model/entities/notice/message.dart';
import 'package:aone_common/data/model/entities/notice/popup_notice.dart';
import 'package:aone_common/data/model/entities/notice/scroll_notice.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:tuple/tuple.dart';
import 'package:get/get.dart';
import '../../../theme/theme_scaffold.dart';
import 'message_center_logic.dart';
import 'package:flutter_html/flutter_html.dart';

class MessageCenterView extends GetView<MessageCenterLogic> {
  const MessageCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = MessageCenterLogic.to.state;
    return GetBuilder<MessageCenterLogic>(
      builder: (_) {
        return ThemeScaffold(
          title: '站内信',
          body: Column(
            children: <Widget>[
              Obx(() {
                return _buildHeaderListView();
              }),
              Expanded(
                child: Obx(() {
                  return _listviewNew();
                }),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _listviewNew() {
    final state = MessageCenterLogic.to.state;
    state.currentMessageItems = state.selIndex == 0
        ? state.messageItems
        : state.selIndex == 1
            ? state.unreadMessageItems
            : state.readedMessageItems;
    if (state.currentMessageItems != null &&
        state.currentMessageItems!.isNotEmpty) {
      return Obx(
        () => ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.selIndex == 0
                ? state.messageItems!.length
                : state.selIndex == 1
                    ? state.unreadMessageItems!.length
                    : state.readedMessageItems!.length,
            itemBuilder: (context, index) {
              MessageItems? item = state.currentMessageItems![index];
              return Container(
                padding: EdgeInsets.only(top: 15.w, left: 12.w, right: 12.w),
                color: AppTheme.normalBgColor,
                child: SwipeActionCell(
                  ///这个key是必要的
                  key: ValueKey(index.toString()),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                        title: "删除",
                        onTap: (CompletionHandler handler) async {
                          controller.deleteMessage(item.id.toString(), index);
                        },
                        color: Colors.red),
                  ],
                  backgroundColor: AppTheme.normalBgColor,
                  child: _itemContent(index, item.title,
                      timeStampIntToSecond(item.addTime ?? 0), item.body ?? ""),
                ),
              );
            }),
      );
    }

    // }

    return const Center(
      child: Text(
        '暂无消息',
      ),
    );
  }

  _buildHeaderListView() {
    var state = MessageCenterLogic.to.state;
    List<Widget> _list = [];
    for (int i = 0; i < state.headerList.length; i++) {
      Tuple2 tuple2 = state.headerList[i];
      _list.add(_itemButton(tuple2, i));
    }
    return Container(
      width: double.infinity,
      height: 45.r,
      decoration:
          BoxDecoration(border: Border.all(color: AppTheme.undeer_line_color)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _list,
      ),
    );
  }

  _itemButton(Tuple2 tuple2, int i) {
    var state = MessageCenterLogic.to.state;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                debugPrint('点击了头部按钮' + i.toString());
                var state = MessageCenterLogic.to.state;
                state.selIndex = i;
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Text(
                tuple2.item1,
                style: TextStyle(
                  color: state.selIndex == i
                      ? Colors.black
                      : const Color(0xff858585),
                  fontSize: 14.sp,
                  fontWeight:
                      state.selIndex == i ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            width: 30.r,
            height: 2.r,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              gradient: state.selIndex == i ? AppTheme.primaryGradient : null,
            ),
            // state.selIndex == i
            //     ? Border(bottom: BorderSide(width: 2, color: AppTheme.primary))
            //     : const Border(bottom: BorderSide.none),
          )
        ],
      ),
    );
  }

  _itemContent(final int index, String? title, String date, String? desc) {
    var state = MessageCenterLogic.to.state;
    MessageItems? item = state.currentMessageItems![index];
    final ctrl = MessageCenterLogic.to;
    return GestureDetector(
      onTap: () {
        ctrl.clickItem(index, title, date, desc, item.isHudong);
        if (item.isRead == 1) {
          ctrl.messageRead(item.id!.toString());
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.w),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(date + " ",
                      style: TextStyle(
                          color: stringToColor('858585'), fontSize: 14.w)),
                  item.isRead == 1
                      ? Icon(
                          Icons.circle,
                          color: const Color(0xffFF0406),
                          size: 10.w,
                        )
                      : const SizedBox(),
                ],
              ),
              Text(
                title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.w,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     SizedBox(
              //       width: 18.5.r,
              //     ),
              //     Flexible(
              //       child: Html(
              //         data: desc!,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 15.r,
              //     ),
              //     Image.asset('assets/images/common/show_next.png'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
