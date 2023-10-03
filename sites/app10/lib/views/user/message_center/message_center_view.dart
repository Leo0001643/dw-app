import 'package:aone_common/data/model/entities/notice/message.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:tuple/tuple.dart';
import 'package:get/get.dart';
import '../../../theme/theme_scaffold.dart';
import 'message_center_logic.dart';

class MessageCenterView extends GetView<MessageCenterLogic> {
  const MessageCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = MessageCenterLogic.to;
    return GetBuilder<MessageCenterLogic>(
      builder: (_) {
        return Obx(() => ThemeScaffold(
              title: '站内信',
              backgroundColor: Colors.white,
              body: Column(
                children: <Widget>[
                  Obx(() {
                    return _buildHeaderListView();
                  }),
                  Container(
                    color: const Color(0xFFF0F1F3),
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 23, bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  c.checkAll();
                                },
                                child: Image.asset(c.isCheckAll.isTrue ? 'assets/images/user/check.png' : 'assets/images/user/check_not.png', width: 16, height: 16)),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: Text(
                                "全选",
                                style: TextStyle(fontSize: 10.sp, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: ()=>{c.deleteAll()},
                          child: Container(
                            height: 20.sp,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(color: Color(0xFFc89d42), borderRadius: BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                "全部删除",
                                style: TextStyle(fontSize: 10.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF0F1F3),
                      // color: Colors.red,
                      padding: EdgeInsets.only(top: 5.r),
                      child: Obx(() {
                        return _listviewNew();
                      }),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget _listviewNew() {
    final state = MessageCenterLogic.to.state;

    if (state.messageItems != null && state.messageItems!.isNotEmpty) {
      return Obx(
        () => ListView.builder(
            itemCount: state.messageItems!.length,
            itemBuilder: (context, index) {
              MessageItems? item = state.messageItems![index];
              if (state.selIndex == 1 && item.isRead != 1) {
                return Container();
              }
              if (state.selIndex == 2 && item.isRead == 1) {
                return Container();
              }

              return _itemContent(index, item.title, timeStampIntToSecond(item.addTime ?? 0), item.body ?? "");
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
    return SizedBox(
      // margin: const EdgeInsets.fromLTRB(20, 16, 5, 10),
      width: double.infinity,
      // color: const Color(0xFFF0F1F3),
      height: 50.r,
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
      flex: 1,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          var state = MessageCenterLogic.to.state;
          if (i == state.selIndex) {
            return;
          }
          state.selIndex = i;
          MessageCenterLogic.to.checkIds.clear();
          MessageCenterLogic.to.isCheckAll.value = false;
          MessageCenterLogic.to.update();
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          height: 50.r,
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          decoration: BoxDecoration(
            border: state.selIndex == i ? Border(bottom: BorderSide(width: 2, color: AppTheme.primaryButtonBg)) : const Border(bottom: BorderSide.none),
          ),
          child: Text(
            tuple2.item1,
            style: TextStyle(color: state.selIndex == i ? Colors.black : const Color(0xffC2C2C2), fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  _itemContent(final int index, String? title, String date, String? desc) {
    var state = MessageCenterLogic.to.state;
    final c = MessageCenterLogic.to;
    MessageItems? item = state.messageItems![index];
    final ctrl = MessageCenterLogic.to;
    return Obx(() => GestureDetector(
          onTap: () {
            ctrl.clickItem(index, title, date, desc, item.isHudong);
            if (item.isRead == 1) {
              ctrl.messageRead(item.id!.toString());
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 8.r, bottom: 8.r, left: 8.r, right: 8.r),
            padding: EdgeInsets.only(top: 16.r, left: 10.r, bottom: 16.r, right: 8.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if(   c.checkIds.indexWhere((element) => element == item.id.toString()) > -1){
                        c.checkIds.remove(item.id.toString());
                        c.isCheckAll.value=false;
                      }else{
                        c.checkIds.add(item.id.toString());
                      }

                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 5.r, right: 9.r),
                        child: Image.asset(
                          c.checkIds.indexWhere((element) => element == item.id.toString()) > -1 ? 'assets/images/user/check.png' : 'assets/images/user/check_not.png',
                          width: 16,
                          height: 16,
                        ))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(date + " ", style: TextStyle(color: stringToColor('4b4b4b'), fontSize: 14.sp)),
                          item.isRead == 1
                              ? Icon(
                                  Icons.circle,
                                  color: Color(0xffff0000),
                                  size: 10.r,
                                )
                              : SizedBox(),
                          SizedBox(
                            width: 12.5.r,
                          ),
                          const Spacer(),
                        ],
                      ),
                      Text(
                        title!,
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14.sp,
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
              ],
            ),
          ),
        ));
  }
}
