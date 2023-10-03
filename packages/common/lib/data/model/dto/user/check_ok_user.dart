class CheckOkUserDto {
  String? userName;
  String? regWenD;
  String? loginPass;

  CheckOkUserDto({this.userName, this.regWenD, this.loginPass});

  CheckOkUserDto.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    regWenD = json['reg_wen_d'];
    loginPass = json['login_pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['reg_wen_d'] = this.regWenD;
    data['login_pass'] = this.loginPass;
    return data;
  }
}
