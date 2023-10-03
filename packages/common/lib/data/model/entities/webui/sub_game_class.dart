/// id : 20
/// menu_name : "新天天彩票"
/// menu_icon : "https://static.cccrrc.com/static/uploads/image/zht/20221003/1664784869286062.png"
/// classids : "3"

class SubGameClass {
  SubGameClass({
    num? id,
    String? menuName,
    String? menuIcon,
    String? classids,
  }) {
    _id = id;
    _menuName = menuName;
    _menuIcon = menuIcon;
    _classids = classids;
  }

  SubGameClass.fromJson(dynamic json) {
    _id = json['id'];
    _menuName = json['menu_name'];
    _menuIcon = json['menu_icon'];
    _classids = json['classids'];
  }

  num? _id;
  String? _menuName;
  String? _menuIcon;
  String? _classids;

  SubGameClass copyWith({
    num? id,
    String? menuName,
    String? menuIcon,
    String? classids,
  }) =>
      SubGameClass(
        id: id ?? _id,
        menuName: menuName ?? _menuName,
        menuIcon: menuIcon ?? _menuIcon,
        classids: classids ?? _classids,
      );

  num? get id => _id;

  String? get menuName => _menuName;

  String? get menuIcon => _menuIcon;

  String? get classids => _classids;

  set id(val) => _id = val;

  set menuName(val) => _menuName = val;

  set menuIcon(val) => _menuIcon = val;

  set classids(val) => _classids = val;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['menu_name'] = _menuName;
    map['menu_icon'] = _menuIcon;
    map['classids'] = _classids;
    return map;
  }
}
