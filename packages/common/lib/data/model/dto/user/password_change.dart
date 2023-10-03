class ChangePasswordDto {
  String? oldpassword;
  String? password;
  String? passwordTwo;

  ChangePasswordDto({
    this.oldpassword,
    this.password,
    this.passwordTwo,
  });

  ChangePasswordDto.fromJson(Map<String, dynamic> json) {
    oldpassword = json['oldpassword'];
    password = json['password'];
    passwordTwo = json['passwordTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oldpassword'] = oldpassword;
    data['password'] = password;
    data['passwordTwo'] = passwordTwo;

    return data;
  }
}

class ChangeQKPasswordDto {
  String? oldqkpass;
  String? password;
  String? qkpass;

  ChangeQKPasswordDto({
    this.oldqkpass,
    this.password,
    this.qkpass,
  });

  ChangeQKPasswordDto.fromJson(Map<String, dynamic> json) {
    oldqkpass = json['oldqkpass'];
    password = json['password'];
    qkpass = json['qkpass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oldqkpass'] = oldqkpass;
    data['password'] = password;
    data['qkpass'] = qkpass;

    return data;
  }
}
