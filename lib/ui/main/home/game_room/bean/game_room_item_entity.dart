class GameRoomItemEntity<T> {
  String? type;
  dynamic? data;
  GameRoomItemEntity({this.type, this.data});

  GameRoomItemEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}
