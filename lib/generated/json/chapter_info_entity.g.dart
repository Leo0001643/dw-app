import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/chapter_info_entity.dart';

ChapterInfoEntity $ChapterInfoEntityFromJson(Map<String, dynamic> json) {
  final ChapterInfoEntity chapterInfoEntity = ChapterInfoEntity();
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    chapterInfoEntity.courseId = courseId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    chapterInfoEntity.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    chapterInfoEntity.order = order;
  }
  final int? parentChapterId = jsonConvert.convert<int>(
      json['parentChapterId']);
  if (parentChapterId != null) {
    chapterInfoEntity.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop = jsonConvert.convert<bool>(
      json['userControlSetTop']);
  if (userControlSetTop != null) {
    chapterInfoEntity.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    chapterInfoEntity.visible = visible;
  }
  final List<String>? children = (json['children'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (children != null) {
    chapterInfoEntity.children = children;
  }
  return chapterInfoEntity;
}

Map<String, dynamic> $ChapterInfoEntityToJson(ChapterInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['courseId'] = entity.courseId;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  data['children'] = entity.children;
  return data;
}

extension ChapterInfoEntityExtension on ChapterInfoEntity {
  ChapterInfoEntity copyWith({
    int? courseId,
    String? name,
    int? order,
    int? parentChapterId,
    bool? userControlSetTop,
    int? visible,
    List<String>? children,
  }) {
    return ChapterInfoEntity()
      ..courseId = courseId ?? this.courseId
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..parentChapterId = parentChapterId ?? this.parentChapterId
      ..userControlSetTop = userControlSetTop ?? this.userControlSetTop
      ..visible = visible ?? this.visible
      ..children = children ?? this.children;
  }
}