import 'package:aone_common/common.dart';

class FavoriteEntity {
  List<FavoriteItems>? items;
  int? statusCode;

  FavoriteEntity({this.items, this.statusCode});

  FavoriteEntity.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <FavoriteItems>[];
      json['items'].forEach((v) {
        items!.add(FavoriteItems.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class FavoriteItems extends OnGameParams {
  int? id;
  int? webGameId;
  String? webGameTag;
  String? nameTw;
  String? imgEn;
  int? isCollect = 1;
  String? imgCn;
  String? imgTw;
  String? classids;
  int? appstate;
  int? webstate;
  String? appval;
  String? webval;
  String? tag;
  int? order;
  String? remarksCn;
  String? remarksEn;
  String? remarksTw;
  int? isGameShow;
  int? isIndex;
  int? isVertical;
  String? currency;
  String? language;
  int? isSystemGame;
  int? isStrongActivity;
  String? apiTag;
  int? internationalType;
  int? gameSubId;
  int? number;
  String? heat;

  FavoriteItems(
      {this.id,
      this.webGameId,
      this.webGameTag,
      this.nameTw,
      this.imgEn,
      this.imgCn,
      this.imgTw,
      this.classids,
      this.appstate,
      this.webstate,
      this.appval,
      this.webval,
      this.tag,
      this.order,
      this.remarksCn,
      this.remarksEn,
      this.remarksTw,
      this.isGameShow,
      this.isIndex,
      this.isVertical,
      this.isCollect,
      this.currency,
      this.language,
      this.isSystemGame,
      this.isStrongActivity,
      this.apiTag,
      this.internationalType,
      this.gameSubId,
      this.number,
      this.heat});

  FavoriteItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    webGameId = json['web_game_id'];
    webGameTag = json['web_game_tag'];
    subTag = json['sub_tag'];
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    nameTw = json['name_tw'];
    imgEn = json['img_en'];
    imgCn = json['img_cn'];
    imgTw = json['img_tw'];
    classids = json['classids'];
    appstate = json['appstate'];
    webstate = json['webstate'];
    appval = json['appval'];
    webval = json['webval'];
    tag = json['tag'];
    order = json['order'];
    remarksCn = json['remarks_cn'];
    remarksEn = json['remarks_en'];
    remarksTw = json['remarks_tw'];
    type = json['type'];
    isGameShow = json['is_game_show'];
    isIndex = json['is_index'];
    isVertical = json['is_vertical'];
    currency = json['currency'];
    language = json['language'];
    isSystemGame = json['is_system_game'];
    isStrongActivity = json['is_strong_activity'];
    apiTag = json['api_tag'];
    internationalType = json['international_type'];
    gameTag = json['game_tag'];
    gameSubId = json['game_sub_id'];
    number = json['number'];
    heat = json['heat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['web_game_id'] = webGameId;
    data['web_game_tag'] = webGameTag;
    data['sub_tag'] = subTag;
    data['name_cn'] = nameCn;
    data['name_en'] = nameEn;
    data['name_tw'] = nameTw;
    data['img_en'] = imgEn;
    data['img_cn'] = imgCn;
    data['img_tw'] = imgTw;
    data['classids'] = classids;
    data['appstate'] = appstate;
    data['webstate'] = webstate;
    data['appval'] = appval;
    data['webval'] = webval;
    data['tag'] = tag;
    data['order'] = order;
    data['remarks_cn'] = remarksCn;
    data['remarks_en'] = remarksEn;
    data['remarks_tw'] = remarksTw;
    data['type'] = type;
    data['is_game_show'] = isGameShow;
    data['is_index'] = isIndex;
    data['is_vertical'] = isVertical;
    data['currency'] = currency;
    data['language'] = language;
    data['is_system_game'] = isSystemGame;
    data['is_strong_activity'] = isStrongActivity;
    data['api_tag'] = apiTag;
    data['international_type'] = internationalType;
    data['game_tag'] = gameTag;
    data['game_sub_id'] = gameSubId;
    data['number'] = number;
    data['heat'] = heat;
    return data;
  }
}
