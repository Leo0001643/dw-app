import 'package:aone_common/common.dart';

// 处理接口传过来的图片url可能不带Host的问题
String staticImageResolver(String? imgUrl) {
  final staticUrl = GlobalService.to.state.siteHeaders.necStaticUrl;

  if (imgUrl != null && imgUrl != '' && !imgUrl.contains('http')) {
    return staticUrl! + imgUrl;
  }

  return imgUrl?.trim() ?? '';
}

extension StringsUtil on String? {

  String staticUrl() {
    return staticImageResolver(this);
  }


}
