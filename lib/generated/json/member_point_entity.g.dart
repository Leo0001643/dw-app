import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/member_point_entity.dart';

MemberPointEntity $MemberPointEntityFromJson(Map<String, dynamic> json) {
  final MemberPointEntity memberPointEntity = MemberPointEntity();
  final double? point = jsonConvert.convert<double>(json['point']);
  if (point != null) {
    memberPointEntity.point = point;
  }
  return memberPointEntity;
}

Map<String, dynamic> $MemberPointEntityToJson(MemberPointEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['point'] = entity.point;
  return data;
}

extension MemberPointEntityExtension on MemberPointEntity {
  MemberPointEntity copyWith({
    double? point,
  }) {
    return MemberPointEntity()
      ..point = point ?? this.point;
  }
}