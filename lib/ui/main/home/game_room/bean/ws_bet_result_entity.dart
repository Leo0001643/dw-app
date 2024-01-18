class WsBetResultEntity {
  String? moneyType;
  String? nickname;
  String? term;
  String? avatar;
  String? time;
  String? type;
  List<Content>? content;
  String? username;
  String? status;

  WsBetResultEntity(
      {this.moneyType,
        this.nickname,
        this.term,
        this.avatar,
        this.time,
        this.type,
        this.content,
        this.username,
        this.status});

  WsBetResultEntity.fromJson(Map<String, dynamic> json) {
    moneyType = "${json['moneyType']}";
    nickname = "${json['nickname']}";
    term = "${json['term']}";
    avatar = "${json['avatar']}";
    time = "${json['time']}";
    type = "${json['type']}";
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    username = "${json['username']}";
    status = "${json['status']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moneyType'] = this.moneyType;
    data['nickname'] = this.nickname;
    data['term'] = this.term;
    data['avatar'] = this.avatar;
    data['time'] = this.time;
    data['type'] = this.type;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['username'] = this.username;
    data['status'] = this.status;
    return data;
  }
}

class Content {
  String? a;
  String? b;
  String? c;
  String? d;
  String? e;

  Content({this.a, this.b, this.c, this.d, this.e});

  Content.fromJson(Map<String, dynamic> json) {
    a = "${json['A']}";
    b = "${json['B']}";
    c = "${json['C']}";
    d = "${json['D']}";
    e = "${json['E']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['A'] = this.a;
    data['B'] = this.b;
    data['C'] = this.c;
    data['D'] = this.d;
    data['E'] = this.e;
    return data;
  }
}
