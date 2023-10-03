import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widget/theme_button.dart';
import '../controllers/card_manager_landscape_controller.dart';
class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = UserService.to.state;

    return Obx(() {
      if (state.userCardList.isEmpty) {
        return _addButton();
      }
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 25.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...state.userCardList.map((e) => _cardItem(e)),
            _addButton(),
          ],
        ),
      );
    });
  }

  Widget _cardItem(BankInfos item) {
    final _ctrl = CardManagerLandScapeController.to;
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 88,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/mine/bank_card_bg.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.bankname ?? '-',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                item.bankcard ?? '-',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _ctrl.state.isEditable
                  ? ThemeButton(
                      onPressed: () => _ctrl.onEditInfo(item),
                      radius: 18,
                      width: 75,
                      btnText: '修改',
                    )
                  : ThemeButton(
                      onPressed: () => _ctrl.onShowInfo(item),
                      radius: 18,
                      width: 75,
                      btnText: '详情',
                    ),
              SizedBox(
                width: 8.w,
              ),
              if (_ctrl.state.isEditable)
                ThemeButton(
                  onPressed: () => _ctrl.deleteCard(item),
                  radius: 18,
                  width: 75,
                  btnText: '删除',
                  color: const LinearGradient(
                    colors: [
                      Color.fromRGBO(227, 222, 204, 1),
                      Color.fromRGBO(144, 132, 115, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addButton() {
    final _ctrl = CardManagerLandScapeController.to;
    return Center(
      child: ThemeButton(
        onPressed: () {
          _ctrl.pageController.jumpToPage(1);
          _ctrl.currentItem = null;
          _ctrl.state.formType = CardFormType.add;
          _ctrl.headerSelIndex = 0;
          _ctrl.state.bankFormKey.currentState?.reset();
          _ctrl.state.currentType = 1;
          _ctrl.isDialog = false;
        },
        btnText: '添加银行卡',
        color: const LinearGradient(
          colors: [
            Color.fromRGBO(227, 222, 204, 1),
            Color.fromRGBO(144, 132, 115, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
