

class WheelInfoEntity {
  List<Rewards>? rewards;
  int? total;
  int? available;
  String? round;
  String? message;

  WheelInfoEntity({this.rewards, this.total, this.available, this.round});

  WheelInfoEntity.fromJson(Map<String, dynamic> json) {
    

    if (json['rewards'] != null) {
      rewards = <Rewards>[];
      json['rewards'].forEach((v) {
        rewards!.add(Rewards.fromJson(v));
      });
    }
    total = json['total'];
    available = json['available'];
    round = json['round'];
    message = json['message'];
  }

}

class Rewards {
  int? id;
  String? name;
  String? amount;
  int? itemType;

  Rewards({this.id, this.name, this.amount, this.itemType});

  Rewards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = "${json['amount']}";
    itemType = json['item_type'];
  }

}
