import 'dart:convert';
import 'dart:typed_data';

import 'package:aone_common/common.dart';
import 'package:crypto/crypto.dart';

abstract class _IAuthenticateProvider {
  // 检查token有效性
  Future<CheckTokenEntity> checkJwt(String jwt);

  // 登录
  Future<LoginEntity> userLogin(LoginDto dto);

  // 注册配置
  Future<RegisterConfigEntity> registerConfig();

  // 用户注册
  Future<UserRegisterEntity> userRegister(UserRegisterDto dto);

  // 代理注册
  Future<UserRegisterEntity> agentRegister(UserRegisterDto dto);

  // 忘记密码 - 验证用户名有效性及表单配置
  Future<ForgetPasswordEntity> forgetPassConfig(String userName);

  // 发送验证码
  Future<void> sendSMSCode(String phone);

  // 忘记密码 - 验证安全问题
  Future<void> checkSecurityQuestion(CheckSecQuestionDto dto);

  // 忘记密码 - 提交
  Future<void> checkOkUser(CheckOkUserDto dto);

  Future<void> stateHeartBeat();

  Future<String> sportsToken();
}

class AuthenticateProvider extends BaseProvider implements _IAuthenticateProvider {
  @override
  Future<CheckTokenEntity> checkJwt(String jwt) async {
    final api = fetch.post(
      ApiUrl.checkToken,
      data: {'authorization': jwt},
    );
    return fetchWithErrorHandler(api).then(
      (res) => CheckTokenEntity.fromJson(res.data),
    );
  }

  @override
  Future<LoginEntity> userLogin(LoginDto dto) {
    var api = fetch.post(
      ApiUrl.userLogin,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => LoginEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RegisterConfigEntity> registerConfig() {
    var api = fetch.post(
      ApiUrl.registerConfig,
    );
    return fetchWithErrorHandler(api).then(
      (res) => RegisterConfigEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<UserRegisterEntity> agentRegister(UserRegisterDto dto) {
    var api = fetch.post(
      ApiUrl.agentRegister,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => UserRegisterEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<UserRegisterEntity> userRegister(UserRegisterDto dto) {
    var api = fetch.post(
      ApiUrl.userRegister,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => UserRegisterEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<ForgetPasswordEntity> forgetPassConfig(String userName) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.forgetPassConfig,
        data: {"user_name": userName},
      ),
    ).then((res) => ForgetPasswordEntity.fromJson(res.data['data']['info']));
  }

  @override
  Future<void> checkOkUser(CheckOkUserDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.checkOkUser,
        data: dto.toJson(),
      ),
    );
  }

  @override
  Future<void> checkSecurityQuestion(CheckSecQuestionDto dto) {
    return fetchWithErrorHandler(fetch.post(
      ApiUrl.checkSecurityQuestion,
      data: dto.toJson(),
    ));
  }

  @override
  Future<void> stateHeartBeat() {
    return fetchWithErrorHandler(fetch.post(
      ApiUrl.stateHeartBeat,
    ));
  }

  @override
  Future<Map<String, dynamic>?> sendSMSCode(String phone) {
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    var content = const Utf8Encoder().convert("${phone}febe664638898177afc664e78f58fd6d$time");
    var digest = md5.convert(content);
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.sendSMSCode,
        data: {"phone": phone, "time": time, "sign": digest.toString()},
      ),
    ).then((res) {
      var result = res.data['data']['status_code'];
      return {'success': result == 200, 'sign': digest};
    });
  }

  @override
  Future<String> sportsToken() {
    // var map={"username":SpStorage.getUserName,"password":SpStorage.getPassword};
    var map = {"username": "test_123qwe", "password": "123456"};
    return fetchWithErrorHandler(fetch.post(ApiUrl.sportToken, data: map)).then((value)  {
      return value.data['data']["token"].toString();
    });
  }
}
