
class GameInitEntity {
  String? url;
  int? isVertical;
  int? statusCode;

  GameInitEntity({this.url, this.isVertical, this.statusCode});

  GameInitEntity.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    isVertical = int.tryParse('${json['is_vertical']}');
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['is_vertical'] = isVertical;
    data['status_code'] = statusCode;
    return data;
  }
}
