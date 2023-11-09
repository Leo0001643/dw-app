import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

CustomerServiceEntity $CustomerServiceEntityFromJson(
    Map<String, dynamic> json) {
  final CustomerServiceEntity customerServiceEntity = CustomerServiceEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    customerServiceEntity.name = name;
  }
  final dynamic config = json['config'];
  if (config != null) {
    customerServiceEntity.config = config;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    customerServiceEntity.type = type;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    customerServiceEntity.image = image;
  }
  final String? comments = jsonConvert.convert<String>(json['comments']);
  if (comments != null) {
    customerServiceEntity.comments = comments;
  }
  final List<
      CustomerServiceCusterServers>? custerServers = (json['custerServers'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<CustomerServiceCusterServers>(
          e) as CustomerServiceCusterServers).toList();
  if (custerServers != null) {
    customerServiceEntity.custerServers = custerServers;
  }
  return customerServiceEntity;
}

Map<String, dynamic> $CustomerServiceEntityToJson(
    CustomerServiceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['config'] = entity.config;
  data['type'] = entity.type;
  data['image'] = entity.image;
  data['comments'] = entity.comments;
  data['custerServers'] = entity.custerServers?.map((v) => v.toJson()).toList();
  return data;
}

extension CustomerServiceEntityExtension on CustomerServiceEntity {
  CustomerServiceEntity copyWith({
    String? name,
    dynamic config,
    String? type,
    String? image,
    String? comments,
    List<CustomerServiceCusterServers>? custerServers,
  }) {
    return CustomerServiceEntity()
      ..name = name ?? this.name
      ..config = config ?? this.config
      ..type = type ?? this.type
      ..image = image ?? this.image
      ..comments = comments ?? this.comments
      ..custerServers = custerServers ?? this.custerServers;
  }
}

CustomerServiceCusterServers $CustomerServiceCusterServersFromJson(
    Map<String, dynamic> json) {
  final CustomerServiceCusterServers customerServiceCusterServers = CustomerServiceCusterServers();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    customerServiceCusterServers.name = name;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    customerServiceCusterServers.number = number;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    customerServiceCusterServers.image = image;
  }
  final String? numberClass = jsonConvert.convert<String>(json['numberClass']);
  if (numberClass != null) {
    customerServiceCusterServers.numberClass = numberClass;
  }
  final dynamic marks = json['marks'];
  if (marks != null) {
    customerServiceCusterServers.marks = marks;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    customerServiceCusterServers.url = url;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    customerServiceCusterServers.email = email;
  }
  final int? isDefault = jsonConvert.convert<int>(json['isDefault']);
  if (isDefault != null) {
    customerServiceCusterServers.isDefault = isDefault;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    customerServiceCusterServers.sort = sort;
  }
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    customerServiceCusterServers.addTime = addTime;
  }
  return customerServiceCusterServers;
}

Map<String, dynamic> $CustomerServiceCusterServersToJson(
    CustomerServiceCusterServers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['number'] = entity.number;
  data['image'] = entity.image;
  data['numberClass'] = entity.numberClass;
  data['marks'] = entity.marks;
  data['url'] = entity.url;
  data['email'] = entity.email;
  data['isDefault'] = entity.isDefault;
  data['sort'] = entity.sort;
  data['addTime'] = entity.addTime;
  return data;
}

extension CustomerServiceCusterServersExtension on CustomerServiceCusterServers {
  CustomerServiceCusterServers copyWith({
    String? name,
    String? number,
    String? image,
    String? numberClass,
    dynamic marks,
    String? url,
    String? email,
    int? isDefault,
    int? sort,
    int? addTime,
  }) {
    return CustomerServiceCusterServers()
      ..name = name ?? this.name
      ..number = number ?? this.number
      ..image = image ?? this.image
      ..numberClass = numberClass ?? this.numberClass
      ..marks = marks ?? this.marks
      ..url = url ?? this.url
      ..email = email ?? this.email
      ..isDefault = isDefault ?? this.isDefault
      ..sort = sort ?? this.sort
      ..addTime = addTime ?? this.addTime;
  }
}