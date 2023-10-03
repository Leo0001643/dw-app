class RechargeDto {
  String? startTime;
  String? endTime;
  int? currentPage;
  int? currentPageTotal;
  String? type;

  RechargeDto({this.startTime, this.endTime, this.currentPage, this.currentPageTotal,this.type});

  RechargeDto.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    currentPage = json['currentPage'];
    currentPageTotal = json['currentPageTotal'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['currentPage'] = this.currentPage;
    data['currentPageTotal'] = this.currentPageTotal;
    data['type'] = this.type;
    return data;
  }
}