// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

import '../../../common.dart';
import 'change_userinfo_state.dart';

class ChangeUserinfoLogic extends BaseController {
  ChangeUserinfoState state = ChangeUserinfoState();

  AuthenticateProvider authenticateProvider = AuthenticateProvider();

  @override
  void onInit() {
    getQuestionList();
    super.onInit();
  }

  //获取问题列表
  Future<void> getQuestionList() async {
    await fetchHandler<RegisterConfigEntity>(
      authenticateProvider.registerConfig(),
      onSuccess: (res) => state.questionList.addAll(res.ques!),
    );
  }
}
