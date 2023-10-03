import 'package:aone_common/utils/colors.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tuple/tuple.dart';

import '../../theme/theme_scaffold.dart';
import 'controllers/account_data_controller.dart';

class AccountDataView extends GetView<AccountDataController> {
  const AccountDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountDataController>(
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
            title: Text(
              '个人设置',
              style: TextStyle(
                fontSize: 18.w,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff0C0C0C),
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: _buildListView(context),
          ),
        );
      },
    );
  }

  _buildHeaderView(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xff151515),
        ),
        child: Container(
          height: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xff222222), width: 1.w))),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/user/center/setting_item0.png',
                width: 18.r,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 12.r,
              ),

              Text('头像',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.w,
                  )),
              const Spacer(),
              Image.asset(
                'assets/images/user/default_headerImg.png',
                width: 20.r,
                height: 20.r,
              ),
              // Image.asset('assets/images/common/show_next.png'),
            ],
          ),
        ));
  }

  List<Widget> _buildListView(BuildContext context) {
    List<Widget> list = [];
    list.add(_buildHeaderView(context));
    for (int i = 0; i < controller.dataList.length; i++) {
      Tuple2 tuple2 = controller.dataList[i];
      list.add(_itemView(tuple2, i));
    }
    return list;
  }

  Widget _itemView(Tuple2 tuple2, int index) {
    List subList = tuple2.item2;
    List<Widget> subListView = [];
    for (int i = 0; i < subList.length; i++) {
      AccountListModel listModel = subList[i];
      subListView.add(
          _buildSubView(listModel, index * 7 + i, subList.length == i + 1));
    }
    return Column(
      children: <Widget>[
        if (index == 1) SizedBox(height: 15.w),
        Column(
          children: subListView,
        )
      ],
    );
  }

  Widget _buildSubView(AccountListModel listModel, int index, bool? isLastRow) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff151515),
      ),
      child: GestureDetector(
        onTap: () {
          controller.itemClickWithTag(listModel, index);
        },
        child: Container(
          height: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              border: isLastRow == true
                  ? null
                  : Border(
                      bottom: BorderSide(
                          color: const Color(0xff222222), width: 1.w))),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/user/center/${listModel.assetName}.png',
                width: 18.r,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 12.r,
              ),
              Text(listModel.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.w,
                  )),
              const Spacer(),
              if (listModel.content.isNotEmpty)
                Text(
                  listModel.content,
                  style: TextStyle(
                    color: const Color(0xFF979797),
                    fontSize: 14.w,
                  ),
                ),
              const SizedBox(
                width: 5,
              ),
              Visibility(
                visible: listModel.showContent,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: const Color(0xff979797),
                  size: 16.w,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
