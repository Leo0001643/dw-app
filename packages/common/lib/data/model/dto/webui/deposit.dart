class DepositDto {
  int? deposit;

  DepositDto(
      {this.deposit});

  DepositDto.fromJson(Map<String, dynamic> json) {
    deposit = json['deposit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deposit'] = this.deposit;
    return data;
  }
}

