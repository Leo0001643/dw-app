import 'package:aone_common/controllers/popularize/popularize_logic.dart';
import 'package:get/get.dart';

class AoneCommissionDescriptionController extends PopularizeLogic {
  final RxInt _tabIndexQuanmintgYiIntroduce = 0.obs;
  set tabIndexQuanmintgYiIntroduce(value) =>
      _tabIndexQuanmintgYiIntroduce.value = value;
  int get tabIndexQuanmintgYiIntroduce => _tabIndexQuanmintgYiIntroduce.value;
}
