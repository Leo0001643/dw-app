class TimeDataContent {
  Map<String, TimeDataItem> all = {}; // 初始化为一个空映射
  int? refreshTime;
  int? timestamp;

  TimeDataContent.fromJson(Map<String, dynamic> json) {
    json['all']?.forEach((key, value) {
      all[key] = TimeDataItem.fromJson(value);
    });

    refreshTime = json['refreshTime'];
    timestamp = json['timestamp'];
  }
}

class TimeDataItem {
  List<TimeDataItemData>? data;
  int? refreshTime;

  TimeDataItem.fromJson(Map<String, dynamic> json) {
    data = [];
    json['data']?.forEach((item) {
      data?.add(TimeDataItemData.fromJson(item));
    });

    refreshTime = json['refreshTime'];
  }
}

class TimeDataItemData {
  int? closeTime;
  int? term;
  int? openTime;

  TimeDataItemData.fromJson(Map<String, dynamic> json) {
    closeTime = json['closeTime'];
    term = json['term'];
    openTime = json['openTime'];
  }
}
