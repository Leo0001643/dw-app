class AllGameImageEntities {
  int? total;
  List<AllGameImageItem>? items;
  int? statusCode;

  AllGameImageEntities({this.total, this.items, this.statusCode});

  AllGameImageEntities.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <AllGameImageItem>[];
      json['items'].forEach((v) {
        items!.add(AllGameImageItem.fromJson(v));
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

class AllGameImageItem {
  String? gameTag;
  String? imgCn;

  AllGameImageItem({this.gameTag, this.imgCn});

  AllGameImageItem.fromJson(Map<String, dynamic> json) {
    gameTag = json['game_tag'];
    imgCn = json['img_cn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_tag'] = gameTag;
    data['img_cn'] = imgCn;
    return data;
  }
}
