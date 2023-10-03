import 'package:aone_common/common.dart';
import 'package:red_task/src/entities/red_rain_info.dart';

import 'dto/dto.dart';
import 'entities/entities.dart';

abstract class _IRedTaskProvider {
  Future<RedTaskInfoEntity> redTaskInfo();

  Future<RedTaskJoinEntity> joinRedActivity(int id);

  Future<RedTaskCenterEntity> redTaskCurrent();

  Future<RedTaskCenterEntity> redTaskLast();

  Future<RedTaskGrabEntity> grabRed(RedTaskGrabDto dto);

  Future<CheckQualificationEntity> checkRedValid();
}

class RedTaskProvider extends BaseProvider implements _IRedTaskProvider {
  @override
  Future<CheckQualificationEntity> checkRedValid() {
    final api = fetch.post(ApiUrl.checkRedValid);
    return fetchWithErrorHandler(api).then(
      (res) => CheckQualificationEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RedTaskGrabEntity> grabRed(RedTaskGrabDto dto) {
    final api = fetch.post(
      ApiUrl.grabRed,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
      (res) => RedTaskGrabEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RedTaskJoinEntity> joinRedActivity(int id) {
    final api = fetch.post(
      ApiUrl.joinRedActivity,
      data: {"id": id},
    );

    return fetchWithErrorHandler(api).then(
      (res) => RedTaskJoinEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RedTaskCenterEntity> redTaskCurrent() {
    final api = fetch.post(
      ApiUrl.redTaskCurrent,
    );

    return fetchWithErrorHandler(api).then(
      (res) => RedTaskCenterEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RedTaskInfoEntity> redTaskInfo() {
    final api = fetch.post(
      ApiUrl.redTaskInfo,
    );
    return fetchWithErrorHandler(api).then(
      (res) => RedTaskInfoEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RedTaskCenterEntity> redTaskLast() {
    final api = fetch.post(
      ApiUrl.redTaskLast,
    );
    return fetchWithErrorHandler(api).then(
      (res) => RedTaskCenterEntity.fromJson(res.data['data']),
    );
  }
}


abstract class _IRedRainProvider {

  Future<RedTaskInfoEntity> redRainInfo();
  Future<RedRainEntity> canGetHongbao();

}

class RedRainProvider extends BaseProvider implements _IRedRainProvider {

   @override
  Future<RedTaskInfoEntity> redRainInfo() {
    final api = fetch.post(
      ApiUrl.redRainInfo,
    );
    return fetchWithErrorHandler(api).then(
      (res) => RedTaskInfoEntity.fromJson(res.data['data']),
    );
  }
  
 @override
  Future<RedRainEntity> canGetHongbao() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.getHongbao,
        data: {"id":""},
      )).then(
            (response) => RedRainEntity.fromJson(response.data),
    );
  }
  
}
