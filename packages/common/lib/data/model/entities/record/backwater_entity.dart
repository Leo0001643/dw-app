class BackwaterEntity {
  int? total;
  List<BackwaterItem>? items;
  String? money;
  int? statusCode;

  BackwaterEntity({this.total, this.items, this.statusCode});

  BackwaterEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <BackwaterItem>[];
      json['items'].forEach((v) {
        items!.add(new BackwaterItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    money = '${json['money']}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['money'] = this.money;
    return data;
  }
}

class BackwaterItem {
  int? id;
  int? userId;
  String? userFsTotal;
  int? addTime;
  int? upTime;
  int? state;
  String? betSum;
  String? remarks;
  String? ordernumber;
  String? user_name;
  String? bet_valid;
  String? bet_win;
  String? user_fs_bl;

  BackwaterItem(
      {this.id,
      this.userId,
      this.userFsTotal,
      this.addTime,
      this.upTime,
      this.state,
      this.ordernumber,
      this.user_name,
      this.user_fs_bl,
      this.bet_valid,
      this.bet_win,
      this.remarks,
      this.betSum});

  BackwaterItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userFsTotal = json['user_fs_total'];
    addTime = json['add_time'];
    upTime = json['up_time'];
    state = json['state'];
    betSum = json['bet_sum'];
    bet_valid = json['bet_valid'];
    ordernumber = json['ordernumber'];
    user_fs_bl = '${json['user_fs_bl']}';
    bet_win = json['bet_win'];
    remarks = json['remarks'];
    user_name = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_fs_total'] = this.userFsTotal;
    data['add_time'] = this.addTime;
    data['up_time'] = this.upTime;
    data['state'] = this.state;
    data['bet_sum'] = this.betSum;
    data['bet_valid'] = this.bet_valid;
    data['ordernumber'] = this.ordernumber;
    data['user_fs_bl'] = this.user_fs_bl;
    data['bet_win'] = this.bet_win;
    data['remarks'] = this.remarks;
    data['user_name'] = this.user_name;
    return data;
  }
}
