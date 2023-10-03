import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String fieldTranslator(LangField data) {
  switch (Get.locale!.languageCode.toString()) {
    case 'zh':
      return data.nameCn ?? '';
    case 'en':
      return data.nameEn ?? '';
    default:
      return '';
  }
}

extension TransUtils on Map<String,dynamic>? {
  Map<String,dynamic> get trJson {
    if (this == null) {
      return {};
    }
    switch (Get.locale!.languageCode.toString()) {
      case 'zh':
        return this!;
      case 'en':
        Map<String,dynamic> map = {};
        this!.forEach((key, value) {
          if (key.contains("_en")) {
            if (value != null && value.toString().isNotEmpty) {
              var cnKey = key.replaceAll("_en", "_cn");
              print("json转换==key=$cnKey=转换前:${this![cnKey]},转换后:$value");
              map[cnKey] = value;
              map[key] = value;
            } else {
              map[key] = value;
            }
          }else {
            if (value.runtimeType.toString().contains("List")) {
              List<Map> list = [];
              if (value.isNotEmpty) {
                value.forEach((e) {
                  var map1 = e as Map<String,dynamic>;
                  list.add(map1.trJson);
                });
              }
              map[key] = list;
            } else if (value.runtimeType.toString().contains("_LinkedHashMap")) {
              var map1 = value as Map<String,dynamic>;
              map[key] = map1.trJson;
            } else {
              map[key] = value;
            }

          }

        });
        return map;

      default:
        return this!;
    }
  }
}
