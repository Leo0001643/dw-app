import 'package:aone_common/common.dart';

import 'dto.dart';
import './entities/entities.dart';

abstract class FortuneWheelApi {
  static const String playWheel = '/api/activity/newdzpPlay';
  static const String wheelInfo = '/api/activity/newdzpInfo';
  static const String wheelProgress = '/api/activity/dzpschedule';
  static const String wheelRecord = '/api/activity/newdzpLog';
}

abstract class _IFortuneWheelProvider {
  // 活动详情
  Future<WheelInfoEntity> wheelInfo(int id);

  // 活动任务进度
  Future<WheelProgressEntity> wheelProgress(int id);

  // 抽奖记录
  Future<WheelRecordEntity> wheelRecord(WheelRecordDto dto);

  // 抽奖抽起来!!!
  Future<WheelPlay> playWheel(int id);
}


class FortuneWheelProvider extends BaseProvider
    implements _IFortuneWheelProvider {
  @override
  Future<WheelPlay> playWheel(int id) {
    return fetchWithErrorHandler(
      fetch.post(
        FortuneWheelApi.playWheel,
        data: {"id": id},
      ),
    ).then(
      (res) => WheelPlay.fromJson(res.data['data']),
    );
  }

  @override
  Future<WheelInfoEntity> wheelInfo(int id) {
    return fetchWithErrorHandler(
      fetch.post(
        FortuneWheelApi.wheelInfo,
        data: {"id": id},
      ),
    ).then(
      (res) => WheelInfoEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<WheelProgressEntity> wheelProgress(int id) {
    return fetchWithErrorHandler(
      fetch.post(
        FortuneWheelApi.wheelProgress,
        data: {"id": id},
      ),
    ).then(
      (res) => WheelProgressEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<WheelRecordEntity> wheelRecord(WheelRecordDto dto) {
    return fetchWithErrorHandler(
      fetch.post(
        FortuneWheelApi.wheelRecord,
        data: dto.toJson(),
      ),
    ).then(
      (res) => WheelRecordEntity.fromJson(res.data['data']),
    );
  }
}
