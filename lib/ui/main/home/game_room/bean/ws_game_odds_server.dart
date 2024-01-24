class WSGameOddsServer {
  List<Content>? content;

  WSGameOddsServer({this.content});

  WSGameOddsServer.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? createTime;
  String? enabled;
  String? id;
  String? jsonKey;
  String? name;
  String? parentId;
  String? play;
  String? tableId;
  String? type;
  String? updateTime;

  Content(
      {this.createTime,
        this.enabled,
        this.id,
        this.jsonKey,
        this.name,
        this.parentId,
        this.play,
        this.tableId,
        this.type,
        this.updateTime});

  Content.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    enabled = json['enabled'];
    id = json['id'];
    jsonKey = json['jsonKey'];
    name = json['name'];
    parentId = json['parentId'];
    play = json['play'];
    tableId = json['tableId'];
    type = json['type'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['enabled'] = this.enabled;
    data['id'] = this.id;
    data['jsonKey'] = this.jsonKey;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['play'] = this.play;
    data['tableId'] = this.tableId;
    data['type'] = this.type;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
