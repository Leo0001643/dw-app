class WsMsgGetGifEntity {
  List<String>? msg;
  String? uniqueId;
  String? nickname;
  String? siteId;
  String? avatar;
  int? time;
  String? type;
  String? tableId;
  String? username;
  int? status;

  WsMsgGetGifEntity(
      {this.msg,
        this.uniqueId,
        this.nickname,
        this.siteId,
        this.avatar,
        this.time,
        this.type,
        this.tableId,
        this.username,
        this.status});

  WsMsgGetGifEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'].cast<String>();
    uniqueId = json['unique_id'];
    nickname = json['nickname'];
    siteId = json['site_id'];
    avatar = json['avatar'];
    time = json['time'];
    type = json['type'];
    tableId = json['table_id'];
    username = json['username'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['unique_id'] = this.uniqueId;
    data['nickname'] = this.nickname;
    data['site_id'] = this.siteId;
    data['avatar'] = this.avatar;
    data['time'] = this.time;
    data['type'] = this.type;
    data['table_id'] = this.tableId;
    data['username'] = this.username;
    data['status'] = this.status;
    return data;
  }
}
