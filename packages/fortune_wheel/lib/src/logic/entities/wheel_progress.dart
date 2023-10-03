import 'dart:math';

class WheelProgressEntity {
  List<WheelProgress>? data;
  int? statusCode;
  int? code;

  WheelProgressEntity({
    this.data,
    this.statusCode,
    this.code,
  });

  WheelProgressEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WheelProgress>[];
      json['data'].forEach((key, v) {
        data!.add(WheelProgress.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    code = json['code'];
  }
}

class WheelProgress {
  String? deposit;
  String? userDeposit;
  String? validBet;
  String? userValidBet;
  String? gameNum;
  String? userGameNum;
  String? fs;
  String? userFs;
  String? profit;
  String? userProfit;
  String? gameType;
  String? num;
  double? percent;

  WheelProgress.fromJson(Map<String, dynamic> json) {
    
    deposit = json['deposit'];
    userDeposit = "${json['user_deposit']}";
    validBet = json['valid_bet'];
    userValidBet = json['user_valid_bet'] == null ? '0.0' : "${json['user_valid_bet']}";
    gameNum = json['game_num'];
    userGameNum = json['user_game_num'] == null ? '0.0' : "${json['user_game_num']}";
    fs = json['fs'];
    userFs = "${json['user_fs']}";
    profit = json['profit'];
    userProfit = "${json['user_profit']}";
    gameType = json['game_type'];
    num = json['num'];
    percent = _resolveProgress(this);

  }

  double _resolveProgress(WheelProgress item) {
    int dividedBy = 0;
    double total = 0;
    if (item.deposit != null) {
      dividedBy++;
      total += _calculateTotal(item.userDeposit!, item.deposit!);
    }
    if (item.profit != null) {
      dividedBy++;
      total += _calculateTotal(item.userProfit!, item.profit!);
    }
    if (item.fs != null) {
      dividedBy++;
      total += _calculateTotal(item.userFs!, item.fs!);
    }
    if (item.gameNum != null) {
      dividedBy++;
      total += _calculateTotal(item.userGameNum!, item.gameNum!);
    }
    if (item.validBet != null) {
      dividedBy++;
      total += _calculateTotal(item.userValidBet!, item.validBet!);
    }

    return ((total / dividedBy).roundToDouble());
  }

  double _calculateTotal(String userDone, String target) {
    return min((double.parse(userDone) / double.parse(target) * 100).roundToDouble(), 100);
  }
}
