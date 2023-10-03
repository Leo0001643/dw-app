import 'package:aone_common/common.dart';

abstract class _ITaskCenterProvider {
  Future<TaskCenterEntity> taskCenterInfo();

  Future<TaskCenterApplyEntities> applyTaskActivity(int id);
}

class TaskCenterProvider extends BaseProvider implements _ITaskCenterProvider {
  @override
  Future<TaskCenterApplyEntities> applyTaskActivity(int id) {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.applyTaskActivity,
        data: {"id": id},
      ),
    ).then(
      (res) => TaskCenterApplyEntities.fromJson(res.data['data']),
    );
  }

  @override
  Future<TaskCenterEntity> taskCenterInfo() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.taskCenterInfo,
        data: TaskCenterDto().toJson(),
      ),
    ).then(
      (res) => TaskCenterEntity.fromJson(res.data['data']),
    );
  }
}
