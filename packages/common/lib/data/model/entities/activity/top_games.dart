import '../../../../common.dart';

class TopGamesEntity {
  List<TopGame>? items;
  int? statusCode;

  TopGamesEntity.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      Map<String, dynamic>? json2 = json['items'];
      for (var element in json2!.values) {
        items!.add(TopGame.fromJson(element));
      }
    }
    statusCode = json['status_code'];
  }
}

/// id : 2526
/// web_game_id : 29
/// web_game_tag : "pgdz"
/// sub_tag : "pgmjhl"
/// name_cn : "麻将胡了"
/// img_cn : "https://static.gyblogs.com/static/uploads/image/zht/20211227/1640610689258797.png"
/// classids : "4"
/// appstate : 1
/// webstate : 1
/// appval : "mahjong-ways"
/// webval : "mahjong-ways"
/// tag : "2,3"
/// order : 99
/// remarks_cn : "0"
/// remarks_en : "0"
/// remarks_tw : "0"
/// type : 2
/// is_game_show : 2
/// is_index : 2
/// is_vertical : 1
/// currency : "CNY,THB,VND"
/// language : "zh_cn,th,vi"
/// is_system_game : 2
/// is_strong_activity : 2
/// api_tag : "65"
/// international_type : 1
/// game_tag : "pgdz"
/// state : 1

class TopGame extends OnGameParams {
  int? id;
  String? gameTag;
  String? nameCn;
  int? whStartTime;
  int? whEndTime;
  String? noSitesId;
  String? activityImgH5UrlEn;
  List<Info>? info;

  String? subTag;
  int? ischangshang;
  int? type;

  TopGame({
    this.id,
    this.gameTag,
    this.nameCn,
    this.whStartTime,
    this.whEndTime,
    this.noSitesId,
    this.info,
    this.subTag,
    this.ischangshang,
    this.type,
    this.activityImgH5UrlEn,
  });

  TopGame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameTag = json['game_tag'];
    activityImgH5UrlEn = json['activity_img_h5_url_en'];
    nameCn = json['name_cn'];
    whStartTime = json['wh_start_time'];
    whEndTime = json['wh_end_time'];
    noSitesId = json['no_sites_id'];
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_tag'] = this.gameTag;
    data['activity_img_h5_url_en'] = this.activityImgH5UrlEn;
    data['name_cn'] = this.nameCn;
    data['wh_start_time'] = this.whStartTime;
    data['wh_end_time'] = this.whEndTime;
    data['no_sites_id'] = this.noSitesId;
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info extends OnGameParams {
  int? gameSubId;
  int? gameId;
  String? nameCn;
  String? imgCn;
  String? gameLogo;
  String? gameName;
  String? classids;
  int? order;
  String? tag;
  int? state;
  int? isIndex;
  int? isVertical;
  int? isScgame;

  Info(
      {this.gameSubId,
      this.gameId,
      this.nameCn,
      this.imgCn,
      this.gameLogo,
      this.gameName,
      this.classids,
      this.order,
      this.tag,
      this.state,
      this.isIndex,
      this.isVertical,
      this.isScgame});

  Info.fromJson(Map<String, dynamic> json) {
    gameSubId = json['game_sub_id'];
    gameId = json['game_id'];
    subTag = json['sub_tag'];
    gameTag = json['game_tag'];
    gameLogo = json['game_logo'];
    gameName = json['game_name'];
    nameCn = json['name_cn'];
    imgCn = json['img_cn'];
    classids = json['classids'];
    order = json['order'];
    tag = json['tag'];
    state = json['state'];
    type = json['type'];
    ischangshang = json['ischangshang'];
    isIndex = json['is_index'];
    isVertical = json['is_vertical'];
    isScgame = json['is_scgame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_sub_id'] = this.gameSubId;
    data['game_id'] = this.gameId;
    data['game_tag'] = this.gameTag;
    data['game_logo'] = this.gameLogo;
    data['game_name'] = this.gameName;
    data['sub_tag'] = this.subTag;
    data['name_cn'] = this.nameCn;
    data['img_cn'] = this.imgCn;
    data['classids'] = this.classids;
    data['order'] = this.order;
    data['tag'] = this.tag;
    data['state'] = this.state;
    data['type'] = this.type;
    data['ischangshang'] = this.ischangshang;
    data['is_index'] = this.isIndex;
    data['is_vertical'] = this.isVertical;
    data['is_scgame'] = this.isScgame;
    return data;
  }
}
