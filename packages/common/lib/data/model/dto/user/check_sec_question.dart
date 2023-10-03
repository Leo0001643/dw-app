class CheckSecQuestionDto {
  String? userName;
  String? regWenD;

  CheckSecQuestionDto({this.userName, this.regWenD});

  CheckSecQuestionDto.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    regWenD = json['reg_wen_d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['reg_wen_d'] = this.regWenD;
    return data;
  }
}
