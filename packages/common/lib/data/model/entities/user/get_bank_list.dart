class GetBankListEntity {
  List<Banks>? items;
  List<Banks>? items2;
  List<Banks>? items3;
  int? statusCode;

  GetBankListEntity({this.items,this.items2,this.items3, this.statusCode});

  GetBankListEntity.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Banks>[];
      json['items'].forEach((v) {
        items!.add(Banks.fromJson(v));
      });
    }
    if (json['items2'] != null) {
      items2 = <Banks>[];
      json['items2'].forEach((v) {
        items2!.add(Banks.fromJson(v));
      });
    }
    if (json['items3'] != null) {
      items3 = <Banks>[];
      json['items3'].forEach((v) {
        items3!.add(Banks.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (items2 != null) {
      data['items2'] = items2!.map((v) => v.toJson()).toList();
    }
    if (items3 != null) {
      data['items3'] = items3!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class Banks {
  int? id;
  String? tag;
  String? name;
  int? state;
  int? addTime;
  String? icon;
  String? names;
  String? currency;
  String? order;

  Banks(
      {this.id,
        this.tag,
        this.name,
        this.state,
        this.addTime,
        this.icon,
        this.names,
        this.currency,
        this.order});

  Banks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    name = json['name'];
    state = json['state'];
    addTime = json['add_time'];
    icon = json['icon'];
    names = json['names'];
    currency = json['currency'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag'] = tag;
    data['name'] = name;
    data['state'] = state;
    data['add_time'] = addTime;
    data['icon'] = icon;
    data['names'] = names;
    data['currency'] = currency;
    data['order'] = order;
    return data;
  }
}