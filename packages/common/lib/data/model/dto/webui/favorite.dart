class FavoriteDto {
  int? gameSubId;
  int? isCollect;

  FavoriteDto({this.gameSubId, this.isCollect});

  FavoriteDto.fromJson(Map<String, dynamic> json) {
    gameSubId = json['game_sub_id'];
    isCollect = json['is_collect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_sub_id'] = gameSubId;
    data['is_collect'] = isCollect;
    return data;
  }
}