class YiOrderListDto {
  int? currentPage;
  int? currentPageTotal;

  YiOrderListDto({
    this.currentPage = 1,
    this.currentPageTotal = 99,
  });

  YiOrderListDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    currentPageTotal = json['currentPageTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['currentPageTotal'] = currentPageTotal;
    return data;
  }
}
