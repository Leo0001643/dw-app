import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/source_check_event.dart';

import 'number_source_state.dart';

class NumberSourceLogic extends GetxController {
  final NumberSourceState state = NumberSourceState();

  StreamSubscription? checkSub;


  @override
  void onReady() {
    checkSub = behaviorBus.on<SourceCheckEvent>().listen((event) {
      if(unEmpty(event.source)){ state.tabController.index = 2; }
    });
    super.onReady();
  }

  @override
  void onClose() {
    checkSub?.cancel();
    super.onClose();
  }

}
