class TaskCenterDto {
  int? currentPage;
  int? currentPageTotal;
  int? isOptimize;
  int? typesid;
  int? common;

  TaskCenterDto({
    this.currentPage = 1,
    this.currentPageTotal = 99,
    this.isOptimize = 1,
    this.typesid,
    this.common = 1,
  });

  TaskCenterDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    currentPageTotal = json['currentPageTotal'];
    isOptimize = json['is_optimize'];
    common = json['common'];
    typesid = json['typesid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['currentPageTotal'] = currentPageTotal;
    data['is_optimize'] = isOptimize;
    data['typesid'] = typesid;
    data['common'] = common;
    return data;
  }
}
