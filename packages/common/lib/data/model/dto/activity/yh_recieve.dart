class YhRecieveDto {
  int? all;
  int? id;

  YhRecieveDto({this.all, this.id});

  YhRecieveDto.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    data['id'] = id;
    return data;
  }
}
