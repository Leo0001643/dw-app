import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../logic/controller.dart';
import '../logic/entities/entities.dart';
import '../utils/utils.dart';

class BoardProgress extends StatelessWidget {
  const BoardProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = FortuneWheelLogic.to.state;

    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: 10.r),
        itemCount: state.progressList.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          var item = state.progressList[index];
          return _progressCard(item, index);
        },
      ),
    );
  }

  Widget _progressCard(WheelProgress item, int index) {
    List<String> _gameTypeList = item.gameType!.split(',').where((element) => element != '').toList();
    return Container(
      height: 105.r,
      margin: EdgeInsets.only(bottom: 16.r),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorSchema.primary,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            '奖励抽奖次数: ${item.num}次',
            textHeightBehavior: StyleUtils.textHeight,
            style: TextStyle(
              height: 2,
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 40.r,
                            height: 40.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 8.0,
                              value: item.percent! / 100,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                ColorSchema.red,
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          Text(
                            '${item.percent!.toInt()}%',
                            style: TextStyle(
                              color: ColorSchema.red,
                              fontSize: 9.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: ColorSchema.primary,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: 60.r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '游戏类型',
                            style: StyleUtils.primaryTextStyle,
                          ),
                          Wrap(
                            children: _gameTypeList.map((e) {
                              return SizedBox(
                                width: 30.r,
                                child: Text(
                                  e,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorSchema.red,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _conditions(item),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _conditions(WheelProgress item) {
    List<Widget> list = [];
    if (item.deposit != null) {
      list.add(
        _conditionRichText(
          '充值金额',
          item.userDeposit!,
          item.deposit!,
        ),
      );
    }
    if (item.gameNum != null) {
      list.add(
        _conditionRichText(
          '注单数量',
          item.userGameNum!,
          item.gameNum!,
        ),
      );
    }

    if (item.validBet != null) {
      list.add(
        _conditionRichText(
          '有效投注',
          item.userValidBet!,
          item.validBet!,
        ),
      );
    }

    if (item.profit != null) {
      list.add(
        _conditionRichText(
          '负盈利',
          item.userProfit!,
          item.profit!,
        ),
      );
    }

    if (item.fs != null) {
      list.add(
        _conditionRichText(
          '返水',
          item.userFs!,
          item.fs!,
        ),
      );
    }

    return list;
  }

  Widget _conditionRichText(
    String title,
    String userDone,
    String target,
  ) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: '$title: ',
        style: StyleUtils.primaryTextStyle,
        children: [
          TextSpan(
            text: '${double.parse(userDone).toInt()}/$target',
            style: TextStyle(
              fontSize: 10.sp,
              color: ColorSchema.red,
            ),
          ),
        ],
      ),
    );
  }
}
