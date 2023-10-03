import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/activity/activity_redpacket.dart';

// 优惠活动
abstract class _IActivityProvider {
  // 优惠活动类型
  Future<ActivityTypesEntity> getTypeList();

  /// 优惠列表
  /// 可根据传入优惠活动类型过滤
  /// 支持分页
  Future<ActivitiesEntity> getActivities(UserInListDto dto);

  /// 优惠活动内容
  /// 由于详情内容中可能会有转成base64的图片，这将导致网络加载时间过长的问题
  /// 所以优惠列表默认不会带上详情内容
  Future<ActivityItem> getActivityDetail(ActivityDetailDto dto);

  /// 优惠奖励列表
  Future<ActivityRewardEntity> activityRewardList(int state);

  /// 领取优惠奖励
  Future<void> collectActivityReward(YhRecieveDto dto);

  /// 可领返水金额
  Future<FsMoneyEntity> rebateAmount();

  /// 领取返水
  Future<HandleFsEntity> collectRebate();

  Future<CommonTipsEntity> userJoin(UserJoinVDto dto);


  /// 判断是否可以抢红包
  Future<ActivityRedpacket> canGetHongbao();
}

class ActivityProvider extends BaseProvider implements _IActivityProvider {
  @override
  Future<ActivityTypesEntity> getTypeList() async {
    return fetchWithErrorHandler(
      fetch.post('/api/activity/typelist_v2'),
    ).then(
      (response) => ActivityTypesEntity.fromJson(response.data['data']),
    );
  }

  @override
  Future<ActivitiesEntity> getActivities(UserInListDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        '/api/activity/userinlist_v2',
        data: dto.toJson(),
      ),
    ).then(
      (response) => ActivitiesEntity.fromJson(response.data['data']),
    );
  }

  @override
  Future<ActivityItem> getActivityDetail(ActivityDetailDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        'api/activity/detail_v2',
        data: dto.toJson(),
      ),
    ).then(
      (response) => ActivityItem.fromJson(response.data['data']),
    );
  }

  @override
  Future<ActivityRewardEntity> activityRewardList(int state) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.activityRewardList,
        data: {"state": state},
      ),
    ).then(
      (res) => ActivityRewardEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<void> collectActivityReward(YhRecieveDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.collectActivityReward,
        data: dto.toJson(),
      ),
    );
  }
  @override
  Future<ActivityRedpacket> canGetHongbao() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.getHongbao,
        data: {"id":""},
      )).then(
            (response) => ActivityRedpacket.fromJson(response.data),
    );
  }

  @override
  Future<HandleFsEntity> collectRebate() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.collectRebate,
      ),
    ).then(
      (res) => HandleFsEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<FsMoneyEntity> rebateAmount() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.rebateAmount,
      ),
    ).then(
      (res) => FsMoneyEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<CommonTipsEntity> userJoin(UserJoinVDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.userJoin,
        data: dto.toJson()
      ),
    ).then(
          (res) => CommonTipsEntity.fromJson(res.data['data']),
    );
  }
}
