class ActivityDetailDto {
  int? id;
  int? typesid;
  int? is_optimize;

  ActivityDetailDto({
    this.id,
    this.typesid,
    this.is_optimize = 1,
  });

  ActivityDetailDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typesid = json['typesid'];
    is_optimize = json['is_optimize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typesid'] = typesid;
    data['is_optimize'] = is_optimize;
    return data;
  }
}
