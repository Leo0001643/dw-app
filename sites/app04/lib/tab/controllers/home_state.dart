import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_common/services/user/user_state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HomeState {
  final RxList<NoticeItems> _noticeItems = RxList.empty();
  RxList<NoticeItems> get noticeItems => _noticeItems;
  set noticeItems(RxList<NoticeItems> value) => _noticeItems.value = value;
}
