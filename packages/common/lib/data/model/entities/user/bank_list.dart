class BankListEntity {
  List<Banks>? banks;
  int? statusCode;

  BankListEntity({this.banks, this.statusCode});

  BankListEntity.fromJson(Map<String, dynamic> json) {
    if (json['banks'] != null) {
      banks = <Banks>[];
      json['banks'].forEach((v) {
        banks!.add(Banks.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banks != null) {
      data['banks'] = banks!.map((v) => v.toJson()).toList();
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
