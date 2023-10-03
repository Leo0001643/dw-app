import 'package:aone_common/common.dart';

class AllGameEntity {
  int? total;
  List<AllGameItem>? items;
  int? statusCode;

  AllGameEntity({this.total, this.items, this.statusCode});

  AllGameEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <AllGameItem>[];
      json['items'].forEach((v) {
        items!.add(AllGameItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class AllGameItem extends OnGameParams {
  int? gameSubId;
  int? gameId;
  String? imgCn;
  String? img;
  String? name;
  String? gameLogo;
  String? gameName;
  String? classids;
  int? order;
  String? tag;
  int? state;     // state 状态   1： 正常   3：游戏维护
  int? isIndex;
  int? isVertical;
  int? isScgame;
  int? gameCount;
  int? isCollect;
  int? number;
  String? heat;
  int? appstate;
  int? webstate;
  bool check=false;

  AllGameItem(
      {this.gameSubId,
      this.gameId,
      this.imgCn,
      this.img,
      this.name,
      this.gameLogo,
      this.gameName,
      this.classids,
      this.order,
      this.tag,
      this.state,
      this.isIndex,
      this.isVertical,
      this.isScgame,
        this.gameCount,
      this.isCollect,
      this.number,
      this.heat,
      this.appstate,
      this.check=false,
      this.webstate});

  AllGameItem.fromJson(Map<String, dynamic> json) {
    gameSubId = json['game_sub_id'];
    gameId = json['game_id'];
    name = json['name'];
    gameLogo = json['game_logo'];
    gameName = json['game_name'];
    gameTag = json['game_tag'];
    subTag = json['sub_tag'];
    nameCn = (json['name_cn']??"").toString();
    imgCn = json['img_cn'];
    img = json['img'];
    classids = json['classids'];
    order = json['order'];
    tag = json['tag'];
    state = json['state'];
    type = json['type'];
    ischangshang = json['ischangshang'];
    isIndex = json['is_index'];
    isVertical = json['is_vertical'];
    isScgame = json['is_scgame'];
    gameCount = json['game_count'];
    isCollect = json['is_collect'];
    number = json['number'];
    heat = json['heat'];
    appstate = json['appstate'];
    webstate = json['webstate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_sub_id'] = gameSubId;
    data['game_id'] = gameId;
    data['name'] = name;
    data['game_logo'] = gameLogo;
    data['game_name'] = gameName;
    data['game_tag'] = gameTag;
    data['sub_tag'] = subTag;
    data['name_cn'] = nameCn;
    data['img_cn'] = imgCn;
    data['img'] = img;
    data['classids'] = classids;
    data['order'] = order;
    data['tag'] = tag;
    data['state'] = state;
    data['type'] = type;
    data['ischangshang'] = ischangshang;
    data['is_index'] = isIndex;
    data['is_vertical'] = isVertical;
    data['is_scgame'] = isScgame;
    data['game_count'] = gameCount;
    data['is_collect'] = isCollect;
    data['number'] = number;
    data['heat'] = heat;
    data['appstate'] = appstate;
    data['webstate'] = webstate;
    return data;
  }
}
