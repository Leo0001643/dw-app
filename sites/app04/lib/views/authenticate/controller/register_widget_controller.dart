import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class RegisterWidgetController extends RegisterLogic {
  RegisterWidgetController({required RegisterType registerType})
      : super(registerType: registerType);
  static RegisterWidgetController get to => Get.find();

  final RxBool _passwordListOne = false.obs;
  get passwordListOne => _passwordListOne.value;
  set passwordListOne(val) => _passwordListOne.value = val;

  final RxBool _passwordListTow = false.obs;
  get passwordListTow => _passwordListTow.value;
  set passwordListTow(val) => _passwordListTow.value = val;

  final RxBool _passwordListThree = false.obs;
  get passwordListThree => _passwordListThree.value;
  set passwordListThree(val) => _passwordListThree.value = val;
  final RegExp _numReg = RegExp(r".*[0-9].*");
  final RegExp _letterReg = RegExp(r".*[A-Za-z].*");

  final _agreeSelect = true.obs;
  get agreeSelect => _agreeSelect.value;
  set agreeSelect(val) => _agreeSelect.value = val;

  var showPassword = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onSuccess() {
    Get.back();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    PopupService.to.triggerPopup(routeName: Routes.userReg);
  }

  showPasswordconditionsub(String value) {
    passwordListOne = false;
    passwordListTow = false;
    passwordListThree = false;

    if ((value.length >= 6) & (value.length <= 20)) {
      passwordListOne = true;
    }

    if (value.contains(_numReg) && value.contains(_letterReg)) {
      passwordListTow = true;
    }

    state.regFormKey.currentState!.save();
    var form =
        Map.of(state.regFormKey.currentState?.value ?? <String, String>{});
    if ((form["user_name"] != value) & (value.isNotEmpty)) {
      passwordListThree = true;
    }
  }
}
