class UserInListDto {
  int? currentPage;
  int? currentPageTotal;
  int? isOptimize;
  int? typesid;
  int? activityType;
  int? common;

  UserInListDto({
    this.currentPage,
    this.currentPageTotal,
    this.isOptimize,
    this.typesid,
    this.activityType,
    this.common,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['currentPageTotal'] = currentPageTotal;
    data['is_optimize'] = isOptimize;
    data['typesid'] = typesid;
    data['activity_type'] = activityType;
    data['common'] = common;
    return data;
  }
}
