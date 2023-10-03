class LadderFsEntity {
  List<LadderItems>? items;
  int? fsType;
  int? isShow;
  String? betValidTotal;
  String? receive;
  String? unReceive;
  int? statusCode;

  LadderFsEntity(
      {this.items,
      this.fsType,
      this.isShow,
      this.betValidTotal,
      this.receive,
      this.unReceive,
      this.statusCode});

  LadderFsEntity.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <LadderItems>[];
      json['items'].forEach((v) {
        items!.add(new LadderItems.fromJson(v));
      });
    }
    fsType = json['fs_type'];
    isShow = json['is_show'];
    betValidTotal = json['bet_valid_total'];
    receive = json['receive'];
    unReceive = json['un_receive'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['fs_type'] = this.fsType;
    data['is_show'] = this.isShow;
    data['bet_valid_total'] = this.betValidTotal;
    data['receive'] = this.receive;
    data['un_receive'] = this.unReceive;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class LadderItems {
  String? label;
  int? gameType;
  List<SubItems>? items;

  LadderItems({this.label, this.gameType, this.items});

  LadderItems.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    gameType = json['game_type'];
    if (json['items'] != null) {
      items = <SubItems>[];
      json['items'].forEach((v) {
        items!.add(new SubItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['game_type'] = this.gameType;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubItems {
  String? gameTag;
  String? nameCn;
  String? nameEn;
  String? nameTw;
  String? gameLogo;
  int? gameId;
  List<ClassList>? classList;
  FsInfo? fsInfo;
  String? fsRate;
  String? betValid;
  String? fsNextRate;
  String? unReceive;

  SubItems(
      {this.gameTag,
      this.nameCn,
      this.nameEn,
      this.nameTw,
      this.gameLogo,
      this.gameId,
      this.classList,
      this.fsInfo,
      this.fsRate,
      this.betValid,
      this.unReceive});

  SubItems.fromJson(Map<String, dynamic> json) {
    gameTag = json['game_tag'];
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    nameTw = json['name_tw'];
    gameLogo = json['game_logo'];
    fsNextRate = json['fs_next_rate'] is String
        ? json['fs_next_rate']
        : "${json['fs_next_rate']}";
    gameId = json['game_id'];
    if (json['class_list'] != null) {
      classList = <ClassList>[];
      json['class_list'].forEach((v) {
        classList!.add(new ClassList.fromJson(v));
      });
    }
    fsInfo = json['fs_info'] != null
        ? new FsInfo.fromJson(json['fs_info'] is List ? {} : json['fs_info'])
        : null;
    fsRate = json['fs_rate'] is String ? json['fs_rate'] : "${json['fs_rate']}";
    betValid = json['bet_valid'];
    unReceive = json['un_receive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_tag'] = this.gameTag;
    data['name_cn'] = this.nameCn;
    data['name_en'] = this.nameEn;
    data['name_tw'] = this.nameTw;
    data['game_logo'] = this.gameLogo;
    data['game_id'] = this.gameId;
    data['fs_next_rate'] = this.fsNextRate;
    if (this.classList != null) {
      data['class_list'] = this.classList!.map((v) => v.toJson()).toList();
    }
    if (this.fsInfo != null) {
      data['fs_info'] = this.fsInfo!.toJson();
    }
    data['fs_rate'] = this.fsRate;
    data['bet_valid'] = this.betValid;
    data['un_receive'] = this.unReceive;
    return data;
  }
}

class ClassList {
  int? id;
  String? nameCn;
  String? nameEn;
  String? nameTw;
  int? pid;
  int? type;

  ClassList(
      {this.id, this.nameCn, this.nameEn, this.nameTw, this.pid, this.type});

  ClassList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    nameTw = json['name_tw'];
    pid = json['pid'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_cn'] = this.nameCn;
    data['name_en'] = this.nameEn;
    data['name_tw'] = this.nameTw;
    data['pid'] = this.pid;
    data['type'] = this.type;
    return data;
  }
}

class FsInfo {
  String? fsBl;
  List<Rate>? rate;
  String? fsMax;
  int? state;

  FsInfo({this.fsBl, this.rate, this.fsMax, this.state});

  FsInfo.fromJson(Map<String, dynamic> json) {
    fsBl = json['fs_bl'];
    if (json['rate'] != null) {
      rate = <Rate>[];
      json['rate'].forEach((v) {
        rate!.add(new Rate.fromJson(v));
      });
    }
    fsMax = json['fs_max'];
    state = json['state'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fs_bl'] = this.fsBl;
    if (this.rate != null) {
      data['rate'] = this.rate!.map((v) => v.toJson()).toList();
    }
    data['fs_max'] = this.fsMax;
    data['state'] = this.state;
    return data;
  }
}

class Rate {
  int? id;
  int? min;
  int? max;
  double? fsbl;

  Rate({this.id, this.min, this.max, this.fsbl});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    min = json['min'];
    max = json['max']?.toString() == null
        ? null
        : int.tryParse(json['max']?.toString() ?? '0') ?? 0;
    fsbl = json['fsbl']?.toString() == null
        ? null
        : double.tryParse(json['fsbl']?.toString() ?? '0.0') ?? 0.0;
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
