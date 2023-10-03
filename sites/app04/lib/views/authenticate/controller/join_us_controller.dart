import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class JoinUsController extends RegisterLogic {

  JoinUsController({required RegisterType registerType})
      : super(registerType: registerType);
  static JoinUsController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onSuccess() {
    Get.back();
  }

  var selAgreementState = true;

  void clickAgreement() {
    print('点击了注册协议');
    selAgreementState = !selAgreementState;
    update();
    print(selAgreementState);
  }

}
