class FsMoneyEntity {
  String? unReceive;
  String? receive;
  int? statusCode;

  FsMoneyEntity({
    this.unReceive,
    this.receive,
    this.statusCode,
  });

  FsMoneyEntity.fromJson(Map<String, dynamic> json) {
    if(json!=null){
      unReceive = json['un_receive'];
      receive = json['receive'];
      statusCode = json['status_code'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['un_receive'] = unReceive;
    data['receive'] = receive;
    data['status_code'] = statusCode;
    return data;
  }
}
