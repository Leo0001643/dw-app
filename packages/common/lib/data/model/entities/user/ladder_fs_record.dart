class LadderFsRecord {
  List<RecordItems>? items;
  int? statusCode;

  LadderFsRecord({this.items, this.statusCode});

  LadderFsRecord.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <RecordItems>[];
      json['items'].forEach((v) {
        items!.add(new RecordItems.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class RecordItems {
  String? label;
  List<Items>? items;

  RecordItems({this.label, this.items});

  RecordItems.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? gameTag;
  String? nameCn;
  String? nameEn;
  String? nameTw;
  int? state;
  int? type;
  int? gameId;
  List<LadderRate>? ladderRate;
  int? fsFangansId;
  int? fsType;

  Items(
      {this.id,
        this.gameTag,
        this.nameCn,
        this.nameEn,
        this.nameTw,
        this.state,
        this.type,
        this.gameId,
        this.ladderRate,
        this.fsFangansId,
        this.fsType});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameTag = json['game_tag'];
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    nameTw = json['name_tw'];
    state = json['state'];
    type = json['type'];
    gameId = json['game_id'];
    if (json['ladder_rate'] != null) {
      ladderRate = <LadderRate>[];
      json['ladder_rate'].forEach((v) {
        ladderRate!.add(new LadderRate.fromJson(v));
      });
    }
    fsFangansId = json['fs_fangans_id'];
    fsType = json['fs_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_tag'] = this.gameTag;
    data['name_cn'] = this.nameCn;
    data['name_en'] = this.nameEn;
    data['name_tw'] = this.nameTw;
    data['state'] = this.state;
    data['type'] = this.type;
    data['game_id'] = this.gameId;
    if (this.ladderRate != null) {
      data['ladder_rate'] = this.ladderRate!.map((v) => v.toJson()).toList();
    }
    data['fs_fangans_id'] = this.fsFangansId;
    data['fs_type'] = this.fsType;
    return data;
  }
}

class LadderRate {
  int? id;
  int? min;
  int? max;
  double? fsbl;

  LadderRate({this.id, this.min, this.max, this.fsbl});

  LadderRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    min = json['min'];
    max = json['max'];
    fsbl = json['fsbl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['min'] = this.min;
    data['max'] = this.max;
    data['fsbl'] = this.fsbl;
    return data;
  }
}