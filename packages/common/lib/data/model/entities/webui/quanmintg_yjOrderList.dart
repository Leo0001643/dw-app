class QuanmintgYiOrderList {
  List<QuanmintgYiOrderListItems>? items;
  int? count;
  int? statusCode;

  QuanmintgYiOrderList({this.items, this.count, this.statusCode});

  QuanmintgYiOrderList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <QuanmintgYiOrderListItems>[];
      json['items'].forEach((v) {
        items!.add(QuanmintgYiOrderListItems.fromJson(v));
      });
    }
    count = json['count'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['status_code'] = statusCode;
    return data;
  }
}

class QuanmintgYiOrderListItems {
  String? riqi;
  String? yijiYeji;
  String? erjiYeji;
  String? sanjiYeji;

  QuanmintgYiOrderListItems({this.riqi, this.yijiYeji, this.erjiYeji, this.sanjiYeji});

  QuanmintgYiOrderListItems.fromJson(Map<String, dynamic> json) {
    riqi = json['riqi'];
    yijiYeji = json['yiji_yeji'];
    erjiYeji = json['erji_yeji'];
    sanjiYeji = json['sanji_yeji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riqi'] = riqi;
    data['yiji_yeji'] = yijiYeji;
    data['erji_yeji'] = erjiYeji;
    data['sanji_yeji'] = sanjiYeji;
    return data;
  }
}
