part of '../portraitRedPage.dart';

class PortraitRedPackageCard2 extends StatelessWidget {
  final RedTaskItem item;

  const PortraitRedPackageCard2({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('状态 == redwar.status.${item.status}'.tr,);
    final ctrl = RedPageController.to;
    return Center(
      child: Container(
        
        margin: EdgeInsets.only(
          left: 10.r,
          right: 10.r,
          bottom: 10.r,
        ),
        width: Get.width - 20.r,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
                      image: RedImage.redWarStandardProvider(
                          'portrait/red_item_bg2.png'),
                      fit: BoxFit.fill,
          ),
          // color: AppRedTheme.styleColor,
      
         /*
          // shape: BoxShape.rectangle,
          boxShadow: [
            // BoxShadow(
            //   color: const Color.fromRGBO(205, 151, 45, 0.41),
            //   offset: const Offset(0,2),
            //   // blurStyle: BlurStyle.solid,

            //   // spreadRadius: 8.r,
            //   blurRadius: 8.r
            // ),
             BoxShadow(
              color: const Color.fromRGBO(255, 255, 255, 0.86),
              // offset: const Offset(0, -4),
              blurStyle: BlurStyle.inner,

              blurRadius: 4.r,
              // spreadRadius: 4.r,

            )
          ]
          */
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                _buildGameType(),
                _buildConditions(),
                _buildRedNumWidget(),
              ],
            ),
            Positioned(
              left: 4.r,
              top: 0.r,
              child: Container(
                  alignment: Alignment.centerLeft,
                width: 100.r,
                height: 34.r,
                // padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 0.r),
                padding: EdgeInsets.only(left: 8.r, bottom: 14.r, right: 8.r),

                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(8)),
                    image: DecorationImage(
                      image: RedImage.redWarStandardProvider(
                          'portrait/red_status_bg2.png'),
                      fit: BoxFit.fill,
                    )),
                child: Text(
                  'redwar.status.${item.status}'.tr,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildGameType() {
    return Container(
      height: 25,
      width: Get.width - 50.r,
      margin: EdgeInsets.only(top: 30.r ),
      padding: EdgeInsets.only(left: 10.r),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(205, 111, 24, 1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Text(
            'red.game.type'.tr,
            // 'popularize.wan.type'.tr,
            style: TextStyle(
              color:  Colors.white,
              fontSize: 12.sp,
            ),
          ),
          ..._buildGameIcons(),
        ],
      ),
    );
  }

  Widget _buildConditions() {
    final ctrl = RedPageController.to;
    final _service = RedTaskService.to;
    List nameList = ctrl.getShowBtnNum(item);

    if (nameList.length == 1) {
      Map map = nameList[0];
      print('类型 = ${map['type']}');

      return _oneCondition(map['money'], map['name'], map['finishState'],
          map['type'] == '1' ? _service.toDeposit : _service.toHome);
    } else {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 7.5.r),
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        shrinkWrap: true,
        childAspectRatio: 16 / 7,
        children: [
          if (item.deposit != null)
            _condition(item.deposit!, 'red.deposit2'.tr, item.finishDeposit == 1,
                _service.toDeposit),
          if (item.dml != null)
            _condition(item.dml!, 'red.rolling2'.tr, item.finishDml == 1, _service.toHome),
          if (item.profit != null)
            _condition(
                item.profit!, 'red.loss2'.tr, item.finishProfit == 1, _service.toHome),
        ],
      );
    }
  }
  Widget _oneCondition(
      String amount, String label, bool isDone, VoidCallback? onTap) {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Container(
      margin: EdgeInsets.only(top: 10.r),
      width: Get.width - 50.r,
      decoration: const BoxDecoration(),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                 isDone ? 'red.done'.tr : '$symbol$amount',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(255, 76, 61, 1),
                ),
              ),
            ),
            Container(
              width: 90.r,
              height: 25.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: isDone
                        ? [
                            const Color.fromRGBO(245, 179, 51, 1),
                            const Color.fromRGBO(245, 179, 51, 1),
                          ]
                        : [
                           const Color.fromRGBO(199, 41, 59, 1),
                           const Color.fromRGBO(199, 41, 59, 1),
                          ]),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isDone ? const Color.fromRGBO(165, 119, 32, 1) : const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _condition(
      String amount, String label, bool isDone, VoidCallback? onTap) {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.r),
      decoration: const BoxDecoration(),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
               isDone ? 'red.done'.tr : '$symbol$amount',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromRGBO(255, 76, 61, 1)),
              ),
            ),
            Container(
              width: 90.r,
              height: 25.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: isDone
                        ? [
                            const Color.fromRGBO(245, 179, 51, 1),
                            const Color.fromRGBO(245, 179, 51, 1),
                          ]
                        : [
                            const Color.fromRGBO(199, 41, 59, 1),
                            const Color.fromRGBO(199, 41, 59, 1),
                          ]),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color:isDone ? const Color.fromRGBO(165, 119, 32, 1) : const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGameIcons() {
    final ctrl = RedPageController.to;
    if (item.gameType == '全部' || item.gameType == 'all' || item.gameType == 'All') {
      
      return ctrl.gameType2Enum.values.map((value) => _gameIcon(value)).toList();
     
    }
    return item.gameType!
        .split(',')
        .map(
          (value) => _gameIcon(ctrl.gameTypeEnum[value]!),
        )
        .toList();
  }

  Widget _gameIcon(String name) {
    return Padding(
      padding: EdgeInsets.only(right: 10.r),
      child: Image.asset(
        'assets/images/redwar/game_icon/${name}2.png',
        package: 'red_task',
        fit: BoxFit.fill,
        width: 16.r,
        height: 16.r,
        // color: const Color.fromRGBO(255, 72, 72, 1),
      ),
    );
  }

  _buildRedNumWidget() {
    final ctrl = RedPageController.to;
    return Container(
      margin: EdgeInsets.only(top: 12.5.r, bottom: 15.r),
      width: Get.width - 50.r,
      height: 82.5.r,
      decoration: BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
        image: RedImage.redWarStandardProvider('portrait/red_num_bg2.png'),
        fit: BoxFit.fill,
      )),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20.r,
          ),
          buildRedNumItem(ctrl.handleRedNum(item)[0]),
          buildRedNumItem(ctrl.handleRedNum(item)[1]),
          buildRedNumItem(ctrl.handleRedNum(item)[2]),
          // if (item.redCount! > 999)
          SizedBox(
            width: 30.r,
            child: Text(
              item.redCount! > 999 ? '+' : '',
              style: TextStyle(
                  color: const Color.fromRGBO(255, 77, 76, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp),
            ),
          ),
          buildGotoBtn()
        ],
      ),
    );
  }

  buildRedNumItem(String showNum) {
    return Container(
      width: 32,
      height: 52,
      margin: EdgeInsets.only(right: 10.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(196, 39, 57, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        showNum,
        style: const TextStyle(
            color: Color.fromRGBO(255, 236, 214, 1),
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
    );
  }

  buildGotoBtn() {
    final ctrl = RedPageController.to;
    return GestureDetector(
      onTap: () => ctrl.grabRed(item),
      child: Container(
        margin: EdgeInsets.only(left: 30.r),
        width: 50.r,
        height: 50.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image:item.status != 1 ? RedImage.redWarStandardProvider('portrait/grab_nor2.png') : RedImage.redWarStandardProvider('portrait/grab_sel2.png'),
          ),
        ),
        child: Center(
          child: Text(
            'red.grob'.tr,
            style: TextStyle(
              color: item.status != 1 ? const Color.fromRGBO(85, 85, 85, 1) : const Color.fromRGBO(199, 41, 59, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
