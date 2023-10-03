import 'dart:convert';

import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs_record.dart';
import 'package:aone_common/data/model/entities/user/back_water_program.dart';

import '../../../common.dart';

abstract class _IUserReportProvider {
  // 个人报表/流水/账单
  Future<ReportEntity> statementReport(SelectDateDto dto);

  // 充值记录
  Future<RechargeEntity> depositReport(SelectDateDto dto);

  // 提款记录
  Future<WidthdrawEntity> withdrawReport(SelectDateDto dto);

  // 优惠记录
  Future<PreferentialEntity> offerReport(SelectDateDto dto);

  // 投注记录
  Future<BetRecordData> betReport(SelectDateDto dto);

  // 投注详情记录
  Future<RecordDetailData> betDetailReport(SelectDateDto dto);

  // 返水记录
  Future<BackwaterEntity> rebateReport(SelectDateDto dto);


  // 取消充值订单
  Future<CommonTipsEntity> rechargeCancel(String order);

  //可领返水
  Future<FsMoneyEntity> rebateAmount();

  //领取返水
  Future<HandleFsEntity> collectRebate();

  //投注返水分类
  Future<LadderFsEntity> getBetBackwater();

  //投注返水分类
  Future<LadderFsRecord> getBetBackwaterById(int id);

  //返水方案是否存在
  Future<BackWaterProgramEntity> fsFanganExist();
}

class UserReportProvider extends BaseProvider implements _IUserReportProvider {
  @override
  Future<ReportEntity> statementReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.statementReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => ReportEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<RechargeEntity> depositReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.depositReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => RechargeEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<WidthdrawEntity> withdrawReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.withdrawReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => WidthdrawEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<PreferentialEntity> offerReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.offerReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => PreferentialEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<BetRecordData> betReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.betReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => BetRecordData.fromJson(res.data['data']),
    );
  }

  @override
  Future<RecordDetailData> betDetailReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.betDetailReport,
      data: dto.toJson(),
    );

    return fetchWithErrorHandler(api).then(
          (res) => RecordDetailData.fromJson(res.data['data']),
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
  Future<BackwaterEntity> rebateReport(SelectDateDto dto) {
    var api = fetch.post(
      ApiUrl.rebateReport,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
          (res) => BackwaterEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<CommonTipsEntity> rechargeCancel(String order) {
    var api = fetch.post(
        ApiUrl.rechargeCancel,
        data: {"ordernumber": order}
    );

    return fetchWithErrorHandler(api).then(
          (res) => CommonTipsEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<LadderFsEntity> getBetBackwater() {
    var api = fetch.post(
        ApiUrl.backwaterData
    );

    return fetchWithErrorHandler(api).then(
          (res) => LadderFsEntity.fromJson(res.data),
    );
  }

  @override
  Future<LadderFsRecord> getBetBackwaterById(int id) {
    var api = fetch.post(
        ApiUrl.backwaterById,
        data: {'id': id}
    );

    return fetchWithErrorHandler(api).then(
          (res) => LadderFsRecord.fromJson(res.data),
    );
  }

  @override
  Future<BackWaterProgramEntity> fsFanganExist() {
    var api = fetch.post(
      ApiUrl.fsFanganExist,
    );

    return fetchWithErrorHandler(api).then(
          (res) => BackWaterProgramEntity.fromJson(res.data),
    );
  }
}
