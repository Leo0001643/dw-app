import 'package:aone_common/core/base/base_provider.dart';
import 'package:aone_common/data/model/dto/webui/deposit.dart';

import '../../api_url.dart';
import '../../model/model.dart';

// 充值
abstract class _IRechargeProvider {
  // 充值 转账充值中的 优惠比例
  Future<DepositYhEntity> deposityh(int type);

  // 充值列表对应充值左侧栏数据
  Future<PayCategoryEntity> getPayxsproduct();

  // 充值
  Future<YongJinEntity> payxxpay(PayxxpayDto dto);

  // 充值教程
  Future<PayCourseEntity> getPayCourse();
}

class RechargeProvider extends BaseProvider implements _IRechargeProvider {
  @override
  Future<DepositYhEntity> deposityh(int type) {
    DepositDto dto = DepositDto();
    dto.deposit = type;

    var api = fetch.post(
      ApiUrl.userDeposityh,
      data: dto.toJson(),
    );
    try {
      return fetchWithErrorHandler(api).then(
        (res) {
          print(res.data);
          return DepositYhEntity.fromJson(res.data['data']);
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PayCategoryEntity> getPayxsproduct() {
    var api = fetch.post(
      ApiUrl.payv4Payxsproduct,
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => PayCategoryEntity.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<YongJinEntity> payxxpay(PayxxpayDto dto) {
    var api = fetch.post(
      ApiUrl.payv4Payxxpay,
      data: dto.toJson(),
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => YongJinEntity.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PayCourseEntity> getPayCourse() {
    var api = fetch.post(
      ApiUrl.payCourse,
    );

    return fetchWithErrorHandler(api).then(
      (res) => PayCourseEntity.fromJson(res.data['data']),
    );
  }
}
