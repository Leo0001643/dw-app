import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/recharge/recharge_logic.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class RechargeTransferController extends BaseController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  final RechargeProvider provider = RechargeProvider();

  final CountdownController countdownController = CountdownController();

  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

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

  String get subTotalUSDT {
    return decimalString(
        (double.tryParse(amount) ?? 0.0) /
            (double.tryParse(currentProduct.huilv!) ?? 0.0),
        4);
  }

  @override
  void onInit() {
    TransferPageArgs args = Get.arguments;
    currentProduct = args.product;
    category = args.category;
    promoRate = getRate(args.rate);
    print(promoRate);
    super.onInit();
  }

  Future<void> onSubmit() async {
    var val = double.tryParse(amount) ?? 0;
    if (amount.length == 0 || val == 0) {
      SmartDialog.showToast('请输入正确的存款金额');
      return;
    }
    final bool valid = formKey.currentState!.saveAndValidate();
    if (valid) {
      SmartDialog.showLoading();
      final dto = PayxxpayDto.fromJson(formKey.currentState!.value);
      dto.tag = category.tag;
      dto.itemId = currentProduct.itemId;
      dto.productId = category.id;
      dto.ishd = promoRate == 0 ? 2 : 1;

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

    for (int i = 0; i < rate.paymentWays!.length; i++) {
      PaymentWays paymentWays = rate.paymentWays![i];
      printInfo(
          info:
              "-------------------->paymentWays  name ${paymentWays.name}    yhRatioNew ${paymentWays.yhRatioNew}");
      if (paymentWays.id == id) {
        return paymentWays.yhRatioNew ?? 0.0;
      }
    }
    return 0.0;
  }
}
