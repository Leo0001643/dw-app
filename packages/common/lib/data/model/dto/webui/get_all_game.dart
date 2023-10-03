class AllGameDto {
  String? gameTag;
  int? classId;
  String? gameSubName;
  int? tag;
  int? changshang;
  int? type;
  int? currentPage;
  int? currentPageTotal;

  AllGameDto({
    this.gameTag,
    this.classId,
    this.gameSubName,
    this.tag,
    this.changshang,
    this.type,
    this.currentPage,
    this.currentPageTotal,
  });

  AllGameDto.fromJson(Map<String, dynamic> json) {
    gameTag = json['game_tag'];
    classId = json['class_id'];
    gameSubName = json['game_sub_name'];
    tag = json['tag'];
    changshang = json['changshang'];
    type = json['type'];
    currentPage = json['currentPage'];
    currentPageTotal = json['currentPageTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_tag'] = gameTag;
    data['class_id'] = classId;
    data['game_sub_name'] = gameSubName;
    data['tag'] = tag;
    data['changshang'] = changshang;
    data['type'] = type;
    data['currentPage'] = currentPage;
    data['currentPageTotal'] = currentPageTotal;
    return data;
  }
}
