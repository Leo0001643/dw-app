class WheelRecordDto {
  int? id;
  int? limit;
  int? page;

  WheelRecordDto({this.id, this.limit, this.page});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['limit'] = limit;
    data['page'] = page;
    return data;
  }
}