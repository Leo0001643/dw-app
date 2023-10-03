import 'package:aone_common/common.dart';
/// game_sub_id : 87
/// game_id : 11
/// frontend_menu_categories_id : 0
/// game_tag : "xin"
/// sub_tag : "jinlaba"
/// name_cn : "金拉霸"
/// img_cn : "https://static.cccrrc.com/static/uploads/image/zht/20220811/1660197237544683.png"
/// classids : "4"
/// order : 100
/// tag : "2,3"
/// state : 1
/// type : 2
/// ischangshang : 2
/// is_index : 2
/// is_vertical : 1
/// is_scgame : 0
/// game_logo : "https://static.cccrrc.com/static/uploads/image/zht/20220110/1641821335764037.png"
/// is_collect : 0
/// number : 433
/// heat : "9.4"

class SubGame extends OnGameParams{
  SubGame({
      num? gameSubId, 
      num? gameId, 
      num? frontendMenuCategoriesId, 
      String? gameTag, 
      String? subTag, 
      String? nameCn, 
      String? imgCn, 
      String? classids, 
      num? order, 
      String? tag, 
      num? state, 
      num? type, 
      num? ischangshang, 
      num? isIndex, 
      num? isVertical, 
      num? isScgame, 
      String? gameLogo, 
      num? isCollect, 
      num? number, 
      String? heat,}){
    _gameSubId = gameSubId;
    _gameId = gameId;
    _frontendMenuCategoriesId = frontendMenuCategoriesId;
    _gameTag = gameTag;
    _subTag = subTag;
    _nameCn = nameCn;
    _imgCn = imgCn;
    _classids = classids;
    _order = order;
    _tag = tag;
    _state = state;
    _type = type;
    _ischangshang = ischangshang;
    _isIndex = isIndex;
    _isVertical = isVertical;
    _isScgame = isScgame;
    _gameLogo = gameLogo;
    _isCollect = isCollect;
    _number = number;
    _heat = heat;
}

  SubGame.fromJson(dynamic json) {
    _gameSubId = json['game_sub_id'];
    _gameId = json['game_id'];
    _frontendMenuCategoriesId = json['frontend_menu_categories_id'];
    _gameTag = json['game_tag'];
    _subTag = json['sub_tag'];
    _nameCn = json['name_cn'];
    _imgCn = json['img_cn'];
    _classids = json['classids'];
    _order = json['order'];
    _tag = json['tag'];
    _state = json['state'];
    _type = json['type'];
    _ischangshang = json['ischangshang'];
    _isIndex = json['is_index'];
    _isVertical = json['is_vertical'];
    _isScgame = json['is_scgame'];
    _gameLogo = json['game_logo'];
    _isCollect = json['is_collect'];
    _number = json['number'];
    _heat = json['heat'];
  }
  num? _gameSubId;
  num? _gameId;
  num? _frontendMenuCategoriesId;
  String? _gameTag;
  String? _subTag;
  String? _nameCn;
  String? _imgCn;
  String? _classids;
  num? _order;
  String? _tag;
  num? _state;
  num? _type;
  num? _ischangshang;
  num? _isIndex;
  num? _isVertical;
  num? _isScgame;
  String? _gameLogo;
  num? _isCollect;
  num? _number;
  String? _heat;
SubGame copyWith({  num? gameSubId,
  num? gameId,
  num? frontendMenuCategoriesId,
  String? gameTag,
  String? subTag,
  String? nameCn,
  String? imgCn,
  String? classids,
  num? order,
  String? tag,
  num? state,
  num? type,
  num? ischangshang,
  num? isIndex,
  num? isVertical,
  num? isScgame,
  String? gameLogo,
  num? isCollect,
  num? number,
  String? heat,
}) => SubGame(  gameSubId: gameSubId ?? _gameSubId,
  gameId: gameId ?? _gameId,
  frontendMenuCategoriesId: frontendMenuCategoriesId ?? _frontendMenuCategoriesId,
  gameTag: gameTag ?? _gameTag,
  subTag: subTag ?? _subTag,
  nameCn: nameCn ?? _nameCn,
  imgCn: imgCn ?? _imgCn,
  classids: classids ?? _classids,
  order: order ?? _order,
  tag: tag ?? _tag,
  state: state ?? _state,
  type: type ?? _type,
  ischangshang: ischangshang ?? _ischangshang,
  isIndex: isIndex ?? _isIndex,
  isVertical: isVertical ?? _isVertical,
  isScgame: isScgame ?? _isScgame,
  gameLogo: gameLogo ?? _gameLogo,
  isCollect: isCollect ?? _isCollect,
  number: number ?? _number,
  heat: heat ?? _heat,
);
  num? get gameSubId => _gameSubId;
  num? get gameId => _gameId;
  num? get frontendMenuCategoriesId => _frontendMenuCategoriesId;
  String? get gameTag => _gameTag;
  String? get subTag => _subTag;
  String? get nameCn => _nameCn;
  String? get imgCn => _imgCn;
  String? get classids => _classids;
  num? get order => _order;
  String? get tag => _tag;
  num? get state => _state;
  num? get isIndex => _isIndex;
  num? get isVertical => _isVertical;
  num? get isScgame => _isScgame;
  String? get gameLogo => _gameLogo;
  num? get isCollect => _isCollect;
  String? get heat => _heat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['game_sub_id'] = _gameSubId;
    map['game_id'] = _gameId;
    map['frontend_menu_categories_id'] = _frontendMenuCategoriesId;
    map['game_tag'] = _gameTag;
    map['sub_tag'] = _subTag;
    map['name_cn'] = _nameCn;
    map['img_cn'] = _imgCn;
    map['classids'] = _classids;
    map['order'] = _order;
    map['tag'] = _tag;
    map['state'] = _state;
    map['type'] = _type;
    map['ischangshang'] = _ischangshang;
    map['is_index'] = _isIndex;
    map['is_vertical'] = _isVertical;
    map['is_scgame'] = _isScgame;
    map['game_logo'] = _gameLogo;
    map['is_collect'] = _isCollect;
    map['number'] = _number;
    map['heat'] = _heat;
    return map;
  }

}