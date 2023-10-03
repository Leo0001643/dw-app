import 'user_in_list.dart';

class ActivityItem {
  ActivityItem({
    ActivityInfo? item,
    int? statusCode,
  }) {
    _item = item;
    _statusCode = statusCode;
  }

  ActivityItem.fromJson(dynamic json) {
    _item = json['item'] != null ? ActivityInfo.fromJson(json['item']) : null;
    _statusCode = json['status_code'];
  }

  ActivityInfo? _item;
  int? _statusCode;

  ActivityItem copyWith({
    ActivityInfo? item,
    int? statusCode,
  }) =>
      ActivityItem(
        item: item ?? _item,
        statusCode: statusCode ?? _statusCode,
      );

  ActivityInfo? get item => _item;

  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_item != null) {
      map['item'] = _item?.toJson();
    }
    map['status_code'] = _statusCode;
    return map;
  }
}
