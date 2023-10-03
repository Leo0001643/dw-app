

import 'package:aone_common/data/model/entities/webui/sub_game.dart';

class SubGameTotal {
    List<SubGame>? items;
    int? total;

    SubGameTotal({this.items, this.total});

    factory SubGameTotal.fromJson(Map<String, dynamic> json) {
        return SubGameTotal(
            items: json['items'] != null ? (json['items'] as List).map((i) => SubGame.fromJson(i)).toList() : null,
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['total'] = total;
        if (items != null) {
            data['items'] = items?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}