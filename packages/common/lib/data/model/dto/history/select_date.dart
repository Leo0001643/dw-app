class SelectDateDto {
  String? startTime;
  String? endTime;
  int? currentPage;
  int? currentPageTotal;
  String? game_tag;
  String? type;
  String? state = "";

  SelectDateDto(
      {this.startTime,
      this.endTime,
      this.currentPage,
      this.currentPageTotal,
      this.game_tag,
      this.type,
      this.state});

  SelectDateDto.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    currentPage = json['currentPage'];
    currentPageTotal = json['currentPageTotal'];
    game_tag = json['game_tag'];
    type = json['game_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['currentPage'] = this.currentPage;
    data['currentPageTotal'] = this.currentPageTotal;
    data['game_tag'] = this.game_tag;
    data['game_type'] = this.type;
    data['state'] = this.state;
    return data;
  }
}
