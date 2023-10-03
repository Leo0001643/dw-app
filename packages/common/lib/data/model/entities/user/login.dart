class LoginEntity {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? message;
  int? statusCode;
  int? isauth;
  int? isAdminPassword;

  LoginEntity(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.message,
      this.statusCode,
      this.isauth,
      this.isAdminPassword});

  LoginEntity.fromJson(Map<String, dynamic> json) {

    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    message = json['message'];
    statusCode = json['status_code'];
    isauth = json['isauth'];
    isAdminPassword = json['is_admin_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['message'] = message;
    data['status_code'] = statusCode;
    data['isauth'] = isauth;
    data['is_admin_password'] = isAdminPassword;
    return data;
  }
}
