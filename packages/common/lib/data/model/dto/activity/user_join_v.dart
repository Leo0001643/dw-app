class UserJoinVDto {
  int? activityid;
  String? extArgs;

  UserJoinVDto({
    this.activityid,
    this.extArgs,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityid'] = activityid;
    data['ext_args'] = extArgs;
    return data;
  }
}

class ExtArgs {
  String? extName;
  String? extVal;

  ExtArgs({
    this.extName,
    this.extVal,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext_name'] = extName;
    data['ext_val'] = extVal;
    return data;
  }
}

class ExtArgs1 {
  String? extName;
  num? extVal;

  ExtArgs1({
    this.extName,
    this.extVal,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext_name'] = extName;
    data['ext_val'] = extVal;
    return data;
  }
}
