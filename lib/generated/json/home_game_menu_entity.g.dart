import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';

HomeGameMenuEntity $HomeGameMenuEntityFromJson(Map<String, dynamic> json) {
  final HomeGameMenuEntity homeGameMenuEntity = HomeGameMenuEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    homeGameMenuEntity.name = name;
  }
  final String? group = jsonConvert.convert<String>(json['group']);
  if (group != null) {
    homeGameMenuEntity.group = group;
  }
  return homeGameMenuEntity;
}

Map<String, dynamic> $HomeGameMenuEntityToJson(HomeGameMenuEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['group'] = entity.group;
  return data;
}

extension HomeGameMenuEntityExtension on HomeGameMenuEntity {
  HomeGameMenuEntity copyWith({
    String? name,
    String? group,
  }) {
    return HomeGameMenuEntity()
      ..name = name ?? this.name
      ..group = group ?? this.group;
  }
}