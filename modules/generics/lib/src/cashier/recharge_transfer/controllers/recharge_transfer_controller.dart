import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/recharge/recharge_logic.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../generics.dart';

class RechargeTransferController extends BaseController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  final RechargeProvider provider = RechargeProvider();

  final CountdownController countdownController = CountdownController();

  final Rx<TransferProduct> _currentProduct = Rx(TransferProduct());
  TransferProduct get currentProduct => _currentProduct.value;
  set currentProduct(TransferProduct val) => _currentProduct.value = val;

  late TransferCategory category;

  final RxDouble _promoRate = 0.0.obs;
  double get promoRate => _promoRate.value;
  set promoRate(double val) => _promoRate.value = val;

  final RxString _amount = ''.obs;
  String get amount => _amount.value;
  set amount(String val) => _amount.value = val;

  final RxInt _promotionIndex = 0.obs;
  int get promotionIndex => _promotionIndex.value;
  set promotionIndex(int index) => _promotionIndex.value = index;

  final RxBool _isPromotionShow = false.obs;
  bool get isPromotionShow => _isPromotionShow.value;
  set isPromotionShow(bool show) => _isPromotionShow.value = show;

  String get subTotalUSDT {
    double amo = double.tryParse(amount) ?? 0.0;
    double huilv = double.tryParse(currentProduct.huilv!) ?? 0.0;
    if (huilv == 0) {
      return '0.0';
    }
    double result = amo / huilv;
    return decimalString(result, 4);
  }

  @override
  void onInit() {
    TransferPageArgs args = Get.arguments;
    currentProduct = args.product;
    category = args.category;
    promoRate = getRate(args.rate);

    super.onInit();
  }

  Future<void> onSubmit() async {
    final bool valid = formKey.currentState!.saveAndValidate();
    if (valid) {
      SmartDialog.showLoading();
      final dto = PayxxpayDto.fromJson(formKey.currentState!.value);
      dto.tag = category.tag;
      dto.itemId = currentProduct.itemId;
      dto.productId = category.id;
      dto.ishd = (promoRate > 0 && promotionIndex == 0) ? 1 : 2;
      dto.type = category.type;

      await fetchHandler<YongJinEntity>(
        provider.payxxpay(dto),
        onSuccess: (item) {
          if (category.type == 2) {
            countdownController.start();
          }
          SmartDialog.showToast(item.message!);
        },
      );
      SmartDialog.dismiss(status: SmartStatus.loading);
    }
  }

  // 获取当前转账汇款通道的优惠比例
  double getRate(DepositYhEntity rate) {
    int? id = category.id;
    if (rate.paymentWays == null || rate.paymentWays!.isEmpty) {
      return 0.0;
    }
    print('paymentWays:${rate.paymentWays}');
    for (int i = 0; i < rate.paymentWays!.length; i++) {
      PaymentWays paymentWays = rate.paymentWays![i];
      if (paymentWays.id == id) {
        return paymentWays.yhRatioNew ?? 0.0;
      }
    }
    return 0.0;
  }
}
