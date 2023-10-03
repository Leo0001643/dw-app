class ArticleEntity {
  List<Article>? info;
  int? statusCode;

  ArticleEntity({this.info, this.statusCode});

  ArticleEntity.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null && json['info'] is Map) {
      info = <Article>[];
      /*json['info'].forEach((e) {
        info!.add(Article.fromJson(e));
      });*/

      info!.add(Article.fromJson(json['info']));
    }else if(json['info'] != null && json['info'] is List){
      info = <Article>[];
     json['info'].forEach((e) {
        info!.add(Article.fromJson(e));
      });
    }

    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['items'] = info!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class Article {
  int? id;
  String? title;
  String? titleEn;
  String? thumb;
  String? body;
  String? bodyEn;
  int? addTime;
  int? tag;

  Article(
      {this.id,
      this.title,
      this.titleEn,
      this.thumb,
      this.body,
      this.bodyEn,
      this.addTime,
      this.tag});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    thumb = json['thumb'];
    body = json['body'];
    bodyEn = json['body_en'];
    addTime = json['add_time'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_en'] = titleEn;
    data['thumb'] = thumb;
    data['body'] = body;
    data['body_en'] = bodyEn;
    data['add_time'] = addTime;
    data['tag'] = tag;
    return data;
  }
}
