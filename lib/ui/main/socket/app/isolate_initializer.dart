import 'dart:async';

import 'package:leisure_games/ui/main/socket/app/center/impl/app_initializer.dart';

import 'app_inst.dart';

class IsolateInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    await AppInst.instance.init();
  }
}
