class QuanmintgUserYjInfo {
  QuanmintgUserYjInfoItems? items;
  int? statusCode;

  QuanmintgUserYjInfo({this.items, this.statusCode});

  QuanmintgUserYjInfo.fromJson(Map<String, dynamic> json) {
    items = json['items'] != null
        ? QuanmintgUserYjInfoItems.fromJson(json['items'])
        : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class QuanmintgUserYjInfoItems {
  int? oneCount;
  int? twoCount;
  int? threeCount;
  int? oneBetTotal;
  int? twoBetTotal;
  int? threeBetTotal;
  int? oneBetTotalDay;
  int? twoBetTotalDay;
  int? threeBetTotalDay;
  int? totalYj;
  int? yesterdayYj;
  int? okGetYj;
  int? oneNewUser;
  int? twoNewUser;
  int? threeNewUser;
  String? tjImg;
  String? tjUrl;
  String? isQm;

  QuanmintgUserYjInfoItems(
      {this.oneCount = 0,
      this.twoCount = 0,
      this.threeCount = 0,
      this.oneBetTotal = 0,
      this.twoBetTotal = 0,
      this.threeBetTotal = 0,
      this.oneBetTotalDay = 0,
      this.twoBetTotalDay = 0,
      this.threeBetTotalDay = 0,
      this.totalYj,
      this.yesterdayYj,
      this.okGetYj,
      this.oneNewUser = 0,
      this.twoNewUser = 0,
      this.threeNewUser = 0,
      this.tjImg,
      this.tjUrl,
      this.isQm});

  QuanmintgUserYjInfoItems.fromJson(Map<String, dynamic> json) {
    oneCount = json['oneCount'];
    twoCount = json['twoCount'];
    threeCount = json['threeCount'];
    oneBetTotal = json['oneBetTotal'];
    twoBetTotal = json['twoBetTotal'];
    threeBetTotal = json['threeBetTotal'];
    oneBetTotalDay = json['oneBetTotalDay'];
    twoBetTotalDay = json['twoBetTotalDay'];
    threeBetTotalDay = json['threeBetTotalDay'];
    totalYj = json['totalYj'];
    yesterdayYj = json['yesterdayYj'];
    okGetYj = json['okGetYj'];
    oneNewUser = json['oneNewUser'];
    twoNewUser = json['twoNewUser'];
    threeNewUser = json['threeNewUser'];
    tjImg = json['tjImg'];
    tjUrl = json['tjUrl'];
    isQm = json['isQm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oneCount'] = oneCount;
    data['twoCount'] = twoCount;
    data['threeCount'] = threeCount;
    data['oneBetTotal'] = oneBetTotal;
    data['twoBetTotal'] = twoBetTotal;
    data['threeBetTotal'] = threeBetTotal;
    data['oneBetTotalDay'] = oneBetTotalDay;
    data['twoBetTotalDay'] = twoBetTotalDay;
    data['threeBetTotalDay'] = threeBetTotalDay;
    data['totalYj'] = totalYj;
    data['yesterdayYj'] = yesterdayYj;
    data['okGetYj'] = okGetYj;
    data['oneNewUser'] = oneNewUser;
    data['twoNewUser'] = twoNewUser;
    data['threeNewUser'] = threeNewUser;
    data['tjImg'] = tjImg;
    data['tjUrl'] = tjUrl;
    data['isQm'] = isQm;
    return data;
  }
}
