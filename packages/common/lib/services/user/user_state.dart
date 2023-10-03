import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/total_count_entity.dart';
import 'package:get/get.dart';

class UserServiceState {
  // 用户余额及信息
  late final Rx<MoneyInfoEntity> _userInfo = Rx(MoneyInfoEntity());

  MoneyInfoEntity get userInfo => _userInfo.value;
  var loginState=false.obs;
  //token过期时间记录用来防重复提示toast
  var tokenExpireTime=0.obs;

  //总投注记录
  late final Rx<TotalCountEntity> _totalCount = Rx(TotalCountEntity());

  TotalCountEntity get totalCount => _totalCount.value;

  set totalCount(value) => _totalCount.value = value;

  set balance(value) => userInfo.money= value;

  set xml(value) => userInfo.xml= value;

  get userinfoFormKey => null;

  set userInfo(value) => _userInfo.value = value;

  int get regDay => _userInfo.value.regDay ?? 0;

  String get trueName => _userInfo.value.truename ?? '';

  String get userName => _userInfo.value.userName ?? '';

  String get balance => _userInfo.value.money ?? '';

  int get xml => _userInfo.value.xml ?? 0;

  String get qq => _userInfo.value.regQq ?? '';

  String get wechat => _userInfo.value.regWeixin ?? '';

  String get regQuestion => _userInfo.value.regWen ?? '';

  String get regAnser => _userInfo.value.regWenD ?? '';

  String get regWenT => _userInfo.value.regWenT ?? '';

  String get phone => _userInfo.value.regPhone ?? '';

  bool get qkpass => _userInfo.value.qkpass ?? false;
  Rx<bool> _isReg = Rx(false);
  set setReg(value) => _isReg = value;
  bool get getReg => _isReg.value;

  int get userId => _userInfo.value.userId ?? 0;

  //推广信息
  late final Rx<QuanmintgUserYjInfoItems> _userYjInfo =
      Rx(QuanmintgUserYjInfoItems());

  set userYjInfo(value) => _userYjInfo.value = value;

  QuanmintgUserYjInfoItems get userYjInfo => _userYjInfo.value;

  String get isQm => _userYjInfo.value.isQm ?? '1';

  // 上次登录记录信息
  final Rx<BeforeLoginInfoEntity> _beforeLoginInfo =
      Rx(BeforeLoginInfoEntity());

  BeforeLoginInfoEntity get beforeLoginInfo => _beforeLoginInfo.value;

  set beforeLoginInfo(BeforeLoginInfoEntity val) =>
      _beforeLoginInfo.value = val;

  // aka user type 用户类型
  final Rx<AuthLevel> _authLevel = Rx(AuthLevel.visitor);

  set authLevel(AuthLevel value) => _authLevel.value = value;

  AuthLevel get authLevel => _authLevel.value;

  bool get isRegularUser => _authLevel.value == AuthLevel.regular;

  bool get isTrial => _authLevel.value == AuthLevel.trial;

  bool get isVisitor => _authLevel.value == AuthLevel.visitor;

  // 用户已绑定银行卡信息
  late final Rx<MyBankListInfoEntity> _userBank = Rx(MyBankListInfoEntity());

  set userBank(MyBankListInfoEntity value) => _userBank.value = value;

  MyBankListInfoEntity get userBank => _userBank.value;

  List<BankInfos> get userCardList => _userBank.value.banks ?? [];

  late final Rx<FactorNeedEntity> _needEntity = Rx(FactorNeedEntity());
  FactorNeedEntity get needEntity => _needEntity.value;
  set needEntity(FactorNeedEntity value) => _needEntity.value = value;
}
