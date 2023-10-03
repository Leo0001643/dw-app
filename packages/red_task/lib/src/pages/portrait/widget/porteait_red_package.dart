part of '../portraitRedPage.dart';

class PortraitRedPackageCard extends StatelessWidget {
  final RedTaskItem item;

  const PortraitRedPackageCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = RedPageController.to;
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: 10.r,
          right: 10.r,
          bottom: 10.r,
        ),
        // height: 215.r,
        width: Get.width - 20.r,
        // padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 8.r),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(253, 243, 231, 1),
          borderRadius: BorderRadius.circular(8),
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: RedImage.redWarStandardPr
          // ovider('landscape/red_package.png'),
          // ),
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
              left: 0,
              top: 0.r,
              child: Container(
                width: 100.r,
                height: 34.r,
                padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(8)),
                    image: DecorationImage(
                      image: RedImage.redWarStandardProvider(
                          'portrait/red_status_bg.png'),
                      fit: BoxFit.fill,
                    )),
                child: Text(
                  'redwar.status.${item.status}'.tr,
                  textAlign: TextAlign.center,
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
      margin: EdgeInsets.only(top: 30.r),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 235, 211, 1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '游戏类型  '.tr,
            style: TextStyle(
              color: const Color.fromRGBO(39, 44, 67, 1),
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
        padding: EdgeInsets.only(top: 3.r),
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        shrinkWrap: true,
        childAspectRatio: 16 / 7,
        children: [
          if (item.deposit != null)
            _condition(item.deposit!, '充值'.tr, item.finishDeposit == 1,
                _service.toDeposit),
          if (item.dml != null)
            _condition(item.dml!, '打码'.tr, item.finishDml == 1, _service.toHome),
          if (item.profit != null)
            _condition(
                item.profit!, '亏损'.tr, item.finishProfit == 1, _service.toHome),
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
        onTap: isDone?(){}: onTap,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$symbol$amount',
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
                            const Color.fromRGBO(128, 43, 41, 0.7),
                            const Color.fromRGBO(128, 43, 41, 1),
                          ]
                        : [
                            const Color.fromRGBO(255, 144, 122, 1),
                            const Color.fromRGBO(255, 71, 71, 1),
                          ]),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1),
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
        onTap:isDone?(){}: onTap,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                '$symbol$amount',
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
                            const Color.fromRGBO(128, 43, 41, 0.7),
                            const Color.fromRGBO(128, 43, 41, 1),
                          ]
                        : [
                            const Color.fromRGBO(255, 144, 122, 1),
                            const Color.fromRGBO(255, 71, 71, 1),
                          ]),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1),
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
      return ctrl.gameTypeEnum.values.map((value) => _gameIcon(value)).toList();
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
      child: SvgPicture.asset(
        'assets/images/redwar/game_icon/${name}_p.svg',
        package: 'red_task',
        fit: BoxFit.fill,
        width: 16.r,
        height: 16.r,
        color: const Color.fromRGBO(255, 72, 72, 1),
      ),
    );
  }

  _buildRedNumWidget() {
    final ctrl = RedPageController.to;
    return Container(
      margin: EdgeInsets.only(top: 12.5.r, bottom: 12.5.r),
      width: Get.width - 50.r,
      height: 82.5.r,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: RedImage.redWarStandardProvider('portrait/red_num_bg.png'),
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
        color: const Color.fromRGBO(255, 77, 76, 1),
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
        margin: EdgeInsets.only(left: 20.r),
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: item.status != 1
                ? const ColorFilter.matrix(<double>[
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ])
                : null,
            image: RedImage.redWarStandardProvider('landscape/grab.png'),
          ),
        ),
        child: Center(
          child: Text(
            '抢'.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
