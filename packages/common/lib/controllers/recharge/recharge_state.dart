part of 'recharge_logic.dart';

class RechargeState {
  final Rx<PayCategoryEntity> _payCategoryEntity = Rx(PayCategoryEntity());

  get payCategoryEntity => _payCategoryEntity.value;

  set payCategoryEntity(value) => _payCategoryEntity.value = value;

  final RxList<OnlineCategory> xsItems = RxList<OnlineCategory>([]);
  final RxList<TransferCategory> xxItems = RxList<TransferCategory>([]);
  final RxList<VipPayProduct> vipItems = RxList<VipPayProduct>([]);

  // 当前通道
  final Rx<dynamic> _currentProduct = Rx(null);
  get currentProduct => _currentProduct.value;
  set currentProduct(value) => _currentProduct.value = value;

  // 线上充值用会员信息
  final Rx<OnlineInfo> _onlineInfo = Rx(OnlineInfo());
  OnlineInfo get onlineInfo => _onlineInfo.value;
  set onlineInfo(value) => _onlineInfo.value = value;

  // 转账汇款充值优惠 PS：只有payment-way是有用的
  final Rx<DepositYhEntity> _rate = Rx(DepositYhEntity());
  get rate => _rate.value;
  set rate(value) => _rate.value = value;

  // 线上支付充值优惠， 全渠道通用
  final RxDouble _onlineRate = 0.0.obs;
  get onlineRate => _onlineRate.value;
  set onlineRate(val) => _onlineRate.value = val;

  // 当前选择通道的优惠比例 ??已经被支付方式的 yh_radio_new ?? 取代???
  final _coefficient = 0.0.obs;
  double get coefficient => _coefficient.value;
  set coefficient(value) => _coefficient.value = value;

  // 有没有权限
  final RxBool _hasPermission = true.obs;
  bool get hasPermission => _hasPermission.value;
  set hasPermission(value) => _hasPermission.value = value;

  final RxBool _isShowDialog = false.obs;
  get getShowDialog => _isShowDialog.value;
  set setShowDialog(value) => _isShowDialog.value = value;
}
