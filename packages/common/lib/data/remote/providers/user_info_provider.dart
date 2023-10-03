import 'package:aone_common/common.dart';

abstract class _IUserInfoProvider {
  // 上次登录信息
  Future<BeforeLoginEntity> beforeLoginInfo();

  // 修改用户信息
  Future<CommonTipsEntity> updateUserInfo(HandleUserinfoDto dto);

  // 修改登录密码
  Future<CommonTipsEntity> updateLoginPwd(ChangePasswordDto dto);

  // 修改提款密码
  Future<CommonTipsEntity> updateWithdrawPwd(ChangeQKPasswordDto dto);
}

class UserInfoProvider extends BaseProvider implements _IUserInfoProvider {
  @override
  Future<BeforeLoginEntity> beforeLoginInfo() {
    final api = fetch.post(ApiUrl.beforeLoginInfo);
    return fetchWithErrorHandler(api).then(
      (res) => BeforeLoginEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<CommonTipsEntity> updateLoginPwd(ChangePasswordDto dto) {
    final api = fetch.post(
      ApiUrl.updateLoginPassword,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => CommonTipsEntity.fromJson(res.data),
    );
  }

  @override
  Future<CommonTipsEntity> updateUserInfo(HandleUserinfoDto dto) {
    final api = fetch.post(
      ApiUrl.updateUserInfo,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => CommonTipsEntity.fromJson(res.data),
    );
  }

  @override
  Future<CommonTipsEntity> updateWithdrawPwd(ChangeQKPasswordDto dto) {
    final api = fetch.post(
      ApiUrl.updateWithdrawPassword,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => CommonTipsEntity.fromJson(res.data),
    );
  }
}
