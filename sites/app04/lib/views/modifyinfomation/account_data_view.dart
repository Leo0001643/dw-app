import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tuple/tuple.dart';
import '../../../../app_service.dart';
import '../../theme/theme_scaffold.dart';
import 'controllers/account_data_controller.dart';

class AccountDataView extends GetView<AccountDataController> {
  const AccountDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountDataController>(
      builder: (_) {
        return ThemeScaffold(
          title: '账号信息',
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 16,
              left: 8,
              bottom: 16,
              right: 8,
            ),
            child: Column(
              children: _buildListView(context),
            ),
          ),
        );
      },
    );
  }

  _buildHeaderView(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: GestureDetector(
              onTap: () {
              },
              child: ClipOval(
                child: Container(
                  width: 88.r,
                  height: 88.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        // offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 1.0, //阴影扩散程度
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/home/headimg${controller.app.headerImg}.jpg",
                    width: 88.r,
                    height: 88.r,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 51),
              child: const Text(
                '编辑',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildListView(BuildContext context) {
    List<Widget> _list = [];
    _list.add(_buildHeaderView(context));
    for (int i = 0; i < controller.dataList.length; i++) {
      Tuple2 tuple2 = controller.dataList[i];
      _list.add(_itemView(tuple2, i));
    }
    return _list;
  }

  Widget _itemView(Tuple2 tuple2, int index) {
    List subList = tuple2.item2;
    List<Widget> _subListView = [];
    for (int i = 0; i < subList.length; i++) {
      AccountListModel listModel = subList[i];
      _subListView.add(_buildSubView(listModel, index * 10 + i));
    }

    return Column(
      children: <Widget>[
        Container(
          height: 22,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 6, top: 18),
          child: Text(
            tuple2.item1,
            style: TextStyle(
                fontSize: 14,
                color: stringToColor('0b213b'),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              color: stringToColor('f2f5f8'),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: _subListView,
          ),
        )
      ],
    );
  }

  Widget _buildSubView(AccountListModel listModel, int index) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print('点击了列表');
            controller.itemClickWithTag(listModel, index);
          },
          child: Container(
            color: Colors.transparent,
            height: 40,
            // margin: const EdgeInsets.only(top: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(listModel.title,
                    style: TextStyle(
                        color: stringToColor('0b213b', 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const Spacer(),
                if (listModel.content.isNotEmpty)
                  Text(
                    listModel.content,
                    style: TextStyle(
                        color: stringToColor('0b213b', 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                if ((index == 3) |
                    (index == 12) |
                    (index == 13) |
                    (index == 14))
                  GestureDetector(
                    onTap: () {
                      AppService.to.toCustomerService();
                      print('点击了在线客服');
                    },
                    child: const Text(
                      '在线客服',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                if (listModel.showContent)
                  const SizedBox(
                    width: 5,
                  ),
                if (listModel.showContent)
                  Image.asset('assets/images/common/show_next.png'),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: stringToColor('0b213b', 0.1),
        )
      ],
    );
  }


}
