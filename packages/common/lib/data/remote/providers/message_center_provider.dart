import '../../../common.dart';

abstract class _IMessageCenterProvider {
  // 首页弹出公告
  Future<NoticeEntity> getPopNotice();

  //首页滚动公告
  // 滚动公告
  Future<ScrollNoticeEntity> scrollNotice();

  //站内信息也就是系统信息
  Future<MessageEntity> getZnxList(SelectDateDto loginDto);

  // 删除消息（含多个消息,多个消息逗号隔开）
  Future<GeneralModel> delMessagge(String id);

  // 所有消息已读
  Future<void> allMessageRead(String id);
}

class MessageCenterProvider extends BaseProvider
    implements _IMessageCenterProvider {
  //首页滚动公告
  @override
  Future<ScrollNoticeEntity> scrollNotice() {
    var api = fetch.post(ApiUrl.scrollNotice);
    return fetchWithErrorHandler(api).then(
      (res) => ScrollNoticeEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<NoticeEntity> getPopNotice() {
    var api = fetch.post(ApiUrl.userPopupList);
    return fetchWithErrorHandler(api).then(
      (res) {
        return NoticeEntity.fromJson(res.data['data']);
      }
    );
  }

  @override
  Future<MessageEntity> getZnxList(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.userMailList,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
      (res) => MessageEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<GeneralModel> delMessagge(String id) {
    var api = fetch.post(
      ApiUrl.userMailDel,
      data: {"id": id},
    );
    return fetchWithErrorHandler(api)
        .then((res) => GeneralModel.fromJson(res.data['data']));
  }

  @override
  Future<GeneralModel> allMessageRead(String id) {
    var api = fetch.post(ApiUrl.userMailRead, data: {'id': id});

    return fetchWithErrorHandler(api)
        .then((res) => GeneralModel.fromJson(res.data['data']));
  }
  //首页获取是否弹窗站内信
  @override
  Future<Map<String,dynamic>> getZnxListWithPop() {
    var api = fetch.post(
      ApiUrl.userMailList,
      data: {
        "is_popup":1,
        "currentPage":1,
        "currentPageTotal":100
      },
    );
    return fetchWithErrorHandler(api).then(
          (res) => res.data['data'],
    );
  }
}
