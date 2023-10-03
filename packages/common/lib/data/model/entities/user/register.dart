class UserRegisterEntity {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  int? statusCode;

  UserRegisterEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.statusCode,
  });

  UserRegisterEntity.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['status_code'] = statusCode;
    return data;
  }
}
