class GameWapPopEntity {
  GameWapPopEntity({
    List<GameWapPopItems>? items,
    int? statusCode,
  }) {
    _items = items;
    _statusCode = statusCode;
  }

  GameWapPopEntity.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(GameWapPopItems.fromJson(v));
      });
    }
    _statusCode = json['status_code'];
  }

  List<GameWapPopItems>? _items;
  int? _statusCode;

  GameWapPopEntity copyWith({
    List<GameWapPopItems>? items,
    int? statusCode,
  }) =>
      GameWapPopEntity(
        items: items ?? _items,
        statusCode: statusCode ?? _statusCode,
      );

  List<GameWapPopItems>? get items => _items;

  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = _statusCode;
    return map;
  }
}

class GameWapPopItems {
  GameWapPopItems({
    String? img,
    String? url,
  }) {
    _img = img;
    _url = url;
  }

  GameWapPopItems.fromJson(dynamic json) {
    _img = json['img'];
    _url = json['url'];
  }

  String? _img;
  String? _url;

  GameWapPopItems copyWith({
    String? img,
    String? url,
  }) =>
      GameWapPopItems(
        img: img ?? _img,
        url: url ?? _url,
      );

  String? get img => _img;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = _img;
    map['url'] = _url;
    return map;
  }
}
