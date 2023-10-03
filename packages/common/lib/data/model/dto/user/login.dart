class LoginDto {
  String? username;
  String? password;
  String? captchaCode;
  String? captchaKey;
  String? dev;
  String? lotNumber;
  String? captchaOutput;
  String? passToken;
  String? genTime;
  String? signToken;
  String? validate;

  LoginDto(
      {this.username,
        this.password,
        this.captchaCode,
        this.captchaKey,
        this.dev,
        this.lotNumber,
        this.captchaOutput,
        this.passToken,
        this.genTime,
        this.validate,
        this.signToken});

  LoginDto.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    captchaCode = json['captcha_code'];
    captchaKey = json['captcha_key'];
    dev = json['dev'];
    lotNumber = json['lot_number'];
    captchaOutput = json['captcha_output'];
    passToken = json['pass_token'];
    genTime = json['gen_time'];
    signToken = json['sign_token'];
    validate = json['validate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['captcha_code'] = captchaCode;
    data['captcha_key'] = captchaKey;
    data['dev'] = dev;
    data['lot_number'] = lotNumber;
    data['captcha_output'] = captchaOutput;
    data['pass_token'] = passToken;
    data['gen_time'] = genTime;
    data['sign_token'] = signToken;
    data['validate'] = validate;
    return data;
  }
}
