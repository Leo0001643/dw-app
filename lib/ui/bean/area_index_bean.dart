
import 'package:leisure_games/app/widget/azlistview/az_common.dart';

class AreaIndexBean extends ISuspensionBean{

  var tabIndex = "";
  String? name;
  AreaIndexBean(this.tabIndex, this.name);


  @override
  String getSuspensionTag() => tabIndex;




}


