import 'package:aone_common/common.dart';

class Env extends BaseEnv {

  Env(): super();

  EnvConfig b33DebugConfig() {
    return EnvConfig(
      appTitle: 'Aone Technology',
      appDomain: 'https://pre-qt.a1pre10.com',
    );
  }
}