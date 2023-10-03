
class ActivityRedpacket {

  String? message;
  int? statusCode;

  ActivityRedpacket({this.message, this.statusCode});

  ActivityRedpacket.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['message'] = message;
    data['status_code'] = statusCode;
    return data;
  }
}