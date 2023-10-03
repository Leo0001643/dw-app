import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/total_count_entity.dart';
import 'package:aone_common/services/user/user_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:aone_common/controllers/activity/sinin_logic.dart'
    as sinin_logic;

class UserService extends BaseService {
  static UserService get to => Get.find();

  final UserServiceState state = UserServiceState();
  final UserInfoProvider provider = UserInfoProvider();
  final AuthenticateProvider authProvider = AuthenticateProvider();
  final UserWalletProvider walletProvider = UserWalletProvider();

  // final    PopularizeState state = PopularizeState();
  final PromotingProvider promotProvider = PromotingProvider();
  final GlobalService _globalService = GlobalService.to;

  Timer? _userStatePolling;

  // 初始化
  Future<UserService> init() async {
    // 已登录用户
    try {
      if (SpStorage.jwtToken != null) {
        var res = await authProvider.checkJwt(SpStorage.jwtToken!);
        if (res.token!) {
          if (AppEnv.config.hasSportsApi &&
              (SpStorage.getUserName.isEmptyOrNull ||
                  SpStorage.getPassword.isEmptyOrNull)) {
            onBeforeLogout();
            state.loginState.value = false;
          } else {
            state.authLevel = AuthLevel.regular;
            state.loginState.value = true;
            await initializeRegularUser();
          }
        } else {
          onBeforeLogout();
          state.loginState.value = false;
        }
      }
    } catch (e) {
      onBeforeLogout();
      debugPrint(e.toString());
    }
    _initSign();
    return this;
  }

  // 初始化已登录用户
  Future<void> initializeRegularUser({
    String? token,
  }) async {
    if (token != null) {
      SpStorage.setToken(token);
    }
    await getBeforeLoginInfo();
    await getUserMoney();
    await getUserBankInfo();
    await getUserYjInfo();
    await factorNeed();
    await sportsToken();
    EventBus.emit(EventType.onLogin);
    if (token != null) {
      state.authLevel = AuthLevel.regular;
    }
    state.loginState.value = true;
    _userStatePolling = Timer.periodic(
      Duration(minutes: _globalService.state.siteHeaders.sendtime ?? 5),
      (_) async {
        try {
          await authProvider.stateHeartBeat();
        } catch (err) {
          debugPrint(err.toString());
        }
      },
    );
  }

  Future<void> sportsToken() async {
    if (AppEnv.config.hasSportsApi) {
      if (!SpStorage.getUserName.isEmptyOrNull &&
          !SpStorage.getPassword.isEmptyOrNull) {
        AuthenticateProvider provider = AuthenticateProvider();
        SpStorage.setSportToken(await provider.sportsToken());
      }
    }
  }

  // 试玩模式
  Future<void> trialMode() async {
    if (state.authLevel != AuthLevel.regular) {
      state.authLevel = AuthLevel.trial;
      state.userInfo = MoneyInfoEntity(
        money: "2000",
        userName:
            "visitor${(DateTime.now().millisecondsSinceEpoch / 1000000).round()}",
      );
    }

    await _globalService.getTrialGames();
  }

  // 登出前置业务处理
  void onBeforeLogout() {
    logout(0);
  }

  // 登出前置业务处理
  void onBeforeLogoutNotEmit() {
    logout(1);
  }

  // 退出登录
  Future<void> logout(int type) async {
    if (state.loginState.value) {
      await fetchHandler(
        walletProvider.logout(),
        onSuccess: (res) {
          SpStorage.removeToken();
          state.userInfo = MoneyInfoEntity();
          state.beforeLoginInfo = BeforeLoginInfoEntity();
          state.authLevel = AuthLevel.visitor;
          state.loginState.value = false;
          state.userBank = MyBankListInfoEntity();
          if (kReleaseMode) {
            Sentry.configureScope((scope) {
              scope.setUser(null);
            });
          }
          _userStatePolling?.cancel();
          if (type == 0) {
            EventBus.emit(EventType.onLogout);
          }
          Get.toNamed(Routes.login);
        },
      );
    } else {
      SpStorage.removeToken();
      state.userInfo = MoneyInfoEntity();
      state.beforeLoginInfo = BeforeLoginInfoEntity();
      state.authLevel = AuthLevel.visitor;
      state.loginState.value = false;
      state.userBank = MyBankListInfoEntity();
      if (kReleaseMode) {
        Sentry.configureScope((scope) {
          scope.setUser(null);
        });
      }
      _userStatePolling?.cancel();

      if (type == 0) {
        EventBus.emit(EventType.onLogout);
      }
    }
  }

  // 获取用户余额及信息
  Future<void> getUserMoney() async {
    await fetchHandler<MoneyEntity>(
      walletProvider.userMoney(),
      onSuccess: (res) {
        state.userInfo = res.infoEntity;
        if (kReleaseMode) {
          Sentry.configureScope((scope) {
            scope.setUser(
              SentryUser(
                username: res.infoEntity!.userName,
              ),
            );
          });
        }
      },
    );
  }

  // 获取用户余额及信息
  Future<void> getUserInfo(Function onCallBack) async {
    await fetchHandler<MoneyEntity>(
      walletProvider.userMoney(),
      onSuccess: (res) {
        state.userInfo = res.infoEntity;
        onCallBack != null ? onCallBack(res.infoEntity) : "";
      },
    );
  }

  // 获取用户余额及信息
  Future<void> getUserToatol() async {
    await fetchHandler<TotalCountEntity>(
      walletProvider.totalCount(),
      onSuccess: (res) {
        state.totalCount = res;
      },
    );
  }

  // 获取用户余额及信息并且回掉
  Future<void> getUserToatolByCallBack(Function onCallBack111) async {
    await fetchHandler<TotalCountEntity>(
      walletProvider.totalCount(),
      onSuccess: (res) {
        state.totalCount = res;
        final _userState = UserService.to.state;
        _userState.totalCount = res;
        onCallBack111 != null ? onCallBack111() : "";
      },
    );
  }

  // 获取上次登录信息
  Future<void> getBeforeLoginInfo() async {
    await fetchHandler<BeforeLoginEntity>(
      provider.beforeLoginInfo(),
      onSuccess: (res) => state.beforeLoginInfo = res.info!,
    );
  }

  Future<void> getUserBankInfo() async {
    await fetchHandler<MyBankListInfoEntity>(walletProvider.myBankList(),
        onSuccess: (res) {
      state.userBank = res;
    });
  }

  //获取是否开启全民推广开关
  Future<void> getUserYjInfo() async {
    await fetchHandler<QuanmintgUserYjInfo>(promotProvider.getPromoList(),
        onSuccess: (item) {
      state.userYjInfo = item.items;
    });
  }

  WithdrawalProvider withdrawalProvider = WithdrawalProvider();

  Future<void> factorNeed() async {
    await fetchHandler<FactorNeedEntity>(
      withdrawalProvider.factorNeed(),
      onSuccess: (res) {
        state.needEntity = res;
      },
    );
  }

  Future<void> _initSign() async {
    //感觉不太好 大部分项目用不到 建议写到单个项目当中 或者集成到factorNeed接口
    //每日签到
    if (state.isRegularUser) {
      var sininConfigInfo = await sinin_logic.getSininConfigInfo();
      state.setReg = ((sininConfigInfo?.trueQd == 1).obs);
    }
  }
}
