
import 'package:azlistview/azlistview.dart';

class AreaIndexBean extends ISuspensionBean{

  var tabIndex = "";
  String? name;
  AreaIndexBean(this.tabIndex, this.name);


  @override
  String getSuspensionTag() => tabIndex;




}


