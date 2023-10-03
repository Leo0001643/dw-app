class TrialEntity {
  List<String>? items;
  int? statusCode;

  TrialEntity({this.items, this.statusCode});

  TrialEntity.fromJson(Map<String, dynamic> json) {
    items = json['items'].cast<String>();
    statusCode = json['status_code'];
  }
}