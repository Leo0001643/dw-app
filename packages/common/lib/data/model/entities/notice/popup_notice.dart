
import 'package:aone_common/data/model/entities/notice/Items.dart';

class NoticeEntity {
  NoticeEntity({
    this.total,
    this.items,});

  NoticeEntity.fromJson(dynamic json) {
    total = json['total'];
    print("  -------->jett total ${total}");
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(NoticeItems.fromJson(v));
      });

    }
    print("  -------->jett items ${items?.length}");
  }
  int ? total;
  List<NoticeItems> ?items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}