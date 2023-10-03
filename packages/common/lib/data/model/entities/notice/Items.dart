import 'dart:convert';

class NoticeItems {
  NoticeItems({
      this.id, 
      this.title, 
      this.titleEn, 
      this.body, 
      this.bodyEn, 
      this.tag, 
      this.order, 
      this.addTime, 
      this.device, 
      this.lang, 
      this.isBk, 
      this.isshow, 
      this.popupWindowDisplayPage,
      this.announcementTheStyle,
      this.titleVi, 
      this.bodyVi,});

  NoticeItems.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    body = json['body'];
    bodyEn = json['body_en'];
    tag = json['tag'];
    order = json['order'];
    addTime = json['add_time'];
    device = json['device'];
    lang = json['lang'];
    isBk = json['is_bk'];
    isshow = json['isshow'];
    popupWindowDisplayPage = json['popup_window_display_page'];
    announcementTheStyle = json['announcement_the_style'];
    titleVi = json['title_vi'];
    bodyVi = json['body_vi'];
  }
  int? id;
  String? title;
  String? titleEn;
  String? body;
  dynamic? bodyEn;
  int? tag;
  int? order;
  int? addTime;
  int? device;
  int? lang;
  int? isBk;
  int? isshow;
  String? popupWindowDisplayPage;
  String? announcementTheStyle;
  String? titleVi;
  dynamic? bodyVi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['title_en'] = titleEn;
    map['body'] = body;
    map['body_en'] = bodyEn;
    map['tag'] = tag;
    map['order'] = order;
    map['add_time'] = addTime;
    map['device'] = device;
    map['lang'] = lang;
    map['is_bk'] = isBk;
    map['isshow'] = isshow;
    map['popup_window_display_page'] = popupWindowDisplayPage;
    map['announcement_the_style'] = announcementTheStyle;
    map['title_vi'] = titleVi;
    map['body_vi'] = bodyVi;
    return map;
  }
}


class AnnouncementBean{
  int? mobile;
  int?  pc;

  AnnouncementBean.fromJson(dynamic content) {
    Map map = json.decode(content);
    mobile = map['mobile'];
    pc = map['pc'];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pc'] = pc;
    map['mobile'] = mobile;

    return map;
  }
}
