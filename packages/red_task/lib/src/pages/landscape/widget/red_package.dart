part of '../landscape.dart';

class RedPackageCard extends StatelessWidget {
  final RedTaskItem item;

  const RedPackageCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = RedPageController.to;
    return Center(
      child: Container(
        height: 218.r,
        width: 160.r,
        padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 8.r),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: RedImage.redWarStandardProvider('landscape/red_package.png'),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text(
                  '可领红包数量',
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 114, 25, 1),
                    fontSize: 12.sp,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bound) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(242, 109, 52, 1),
                          Color.fromRGBO(249, 19, 45, 1),
                        ],
                        stops: [
                          0.5,
                          1.0
                        ]).createShader(
                      Offset.zero & bound.size,
                    );
                  },
                  child: Text(
                    item.redCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => ctrl.grabRed(item),
                  child: Container(
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
                        image: RedImage.redWarStandardProvider(
                            'landscape/grab.png'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '抢',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '游戏类型:',
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 228, 154, 1),
                        fontSize: 12.sp,
                      ),
                    ),
                    ..._buildGameIcons(),
                  ],
                ),
                _buildConditions(),
              ],
            ),
            Positioned(
              bottom: -7.r,
              child: Container(
                width: 100.r,
                padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(253, 208, 168, 1),
                      Color.fromRGBO(250, 238, 235, 1),
                    ],
                  ),
                ),
                child: Text(
                  'redwar.status.${item.status}'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(212, 24, 57, 1),
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

  Widget _buildConditions() {
    final _service = RedTaskService.to;
    return GridView.count(
      padding: EdgeInsets.only(top: 3.r),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      shrinkWrap: true,
      childAspectRatio: 16 / 7,
      children: [
        if (item.deposit != null)
          _condition(
              item.deposit!, '充值', item.finishDeposit == 1, _service.toDeposit),
        if (item.dml != null)
          _condition(item.dml!, '打码', item.finishDml == 1, _service.toHome),
        if (item.profit != null)
          _condition(
              item.profit!, '亏损', item.finishProfit == 1, _service.toHome),
      ],
    );
  }

  Widget _condition(
      String amount, String label, bool isDone, VoidCallback? onTap) {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.r),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: isDone
              ? const ColorFilter.matrix(
                  [
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
                  ],
                )
              : null,
          image: RedImage.redWarStandardProvider(
            'landscape/condition_label.png',
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$symbol$amount',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color.fromRGBO(215, 59, 51, 1),
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 9.sp,
                color: const Color.fromRGBO(255, 228, 154, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGameIcons() {
    final ctrl = RedPageController.to;
    if (item.gameType == '全部' || item.gameType == 'all') {
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
      padding: EdgeInsets.only(right: 1.r),
      child: SvgPicture.asset(
        'assets/images/redwar/game_icon/${name}.svg',
        package: 'red_task',
        fit: BoxFit.fill,
        width: 12.r,
        height: 12.r,
        color: const Color.fromRGBO(255, 228, 154, 1),
      ),
    );
  }
}
