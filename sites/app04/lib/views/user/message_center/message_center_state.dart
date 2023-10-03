import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_common/data/model/entities/notice/message.dart';
import 'package:aone_common/data/model/entities/notice/popup_notice.dart';
import 'package:aone_common/data/model/entities/notice/scroll_notice.dart';
import 'package:get/get.dart';

class MessageCenterState {
  final RxList headerList = RxList.empty();

  late final RxList<NoticeItems>? noticeItems = RxList.empty();
  final RxList<ScrollNoticeItem>? scrollNoticeItems = RxList.empty();
  late final RxList<MessageItems>? messageItems = RxList.empty();
  late final RxList<MessageItems>? unreadMessageItems = RxList.empty();
  late final RxList<MessageItems>? readedMessageItems = RxList.empty();


  late final Rx<NoticeEntity> noticeEntity;
  late final Rx<ScrollNoticeEntity> scrollNoticeEntity;
  late final Rx<MessageEntity> messageEntity;

  final RxInt _selIndex = 0.obs;

  int get selIndex => _selIndex.value;

  set selIndex(value) => _selIndex.value = value;

  final RxString _title = ''.obs;

  String get title => _title.value;

  set title(value) => _title.value = value;

  final RxString _date = ''.obs;

  String get date => _date.value;

  set date(value) => _date.value = value;


  final RxString _desc = ''.obs;

  String get desc => _desc.value;

  set desc(value) => _desc.value = value;

  final RxInt _isHuodong = 0.obs;

  int get isHuodong => _isHuodong.value;

  set isHuodong(value) => _isHuodong.value = value;

  RxList<MessageItems>? _currentMessageItems = RxList.empty();
  RxList<MessageItems>? get currentMessageItems => _currentMessageItems;
  set currentMessageItems(value) => _currentMessageItems = value;
}
