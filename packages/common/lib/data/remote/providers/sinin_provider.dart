import 'package:aone_common/common.dart';

abstract class _SininProvider {
  /*签到相关 */
  Future<SininConfigData> sininConfigInfo();

  /*签到相关 */
  Future<SininData> sininInfo();

  //立即签到
  Future<SininBackEntivity> userGotoSinin();
  //补签
  Future<SininBackEntivity> postReissueSininData(String reissueDate);

  Future<SininBackEntivity> signinReset();
}

class SininProvider extends BaseProvider implements _SininProvider {
  //签到配置条件
  @override
  Future<SininConfigData> sininConfigInfo() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.signinConfig,
      ),
    ).then(
      (response) => SininConfigData.fromJson(response.data['data']),
    );
  }

  //获取签到信息
  @override
  Future<SininData> sininInfo() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.signinInfo,
      ),
    ).then(
      (response) => SininData.fromJson(response.data['data']),
    );
  }

  //立即签到
  @override
  Future<SininBackEntivity> userGotoSinin() {
    return fetchWithErrorHandler(
      fetch.post(
        ApiUrl.gotoSigin,
      ),
    ).then(
      (response) => SininBackEntivity.fromJson(response.data['data']),
    );
  }

  @override
  Future<SininBackEntivity> postReissueSininData(String reissueDate) {
    return fetchWithErrorHandler(
      fetch.post(ApiUrl.reissueSignin, data: {'reissue_date': reissueDate}),
    ).then(
      (response) => SininBackEntivity.fromJson(response.data['data']),
    );
  }

  @override
  Future<SininBackEntivity> signinReset() {
    return fetchWithErrorHandler(
      fetch.post(ApiUrl.signinReset),
    ).then(
      (response) => SininBackEntivity.fromJson(response.data['data']),
    );
  }
}

/*
static Future<FetchResponse<SininBackEntivity>> userReissue(
      String? reissueDate,
      {bool? noLoading}) async {
    dynamic data = {'reissue_date': reissueDate};
    try {
      var response = await Fetch.post(
        '/api/user/reissue',
        data: data,
        noLoading: noLoading,
      );
      return FetchResponse.completed(
        SininBackEntivity.fromJson(response['data']),
        response,
      );
    } on DioError catch (e) {
      return FetchResponse.error(e);
    }
  }

Future<void> postReissueSininData(String reissueDate) async {
    var res = await ActivityApi.userReissue(
      reissueDate,
      noLoading: false,
    );
    if (res.status == Status.done) {
      if (res.data!.statusCode == 200) {
        SmartDialog.showToast('补签成功');
        getUserSininInfoList();
      } else {
        SmartDialog.showToast(res.data!.message!);
      }
    }
  }
//签到
  static Future<FetchResponse<SininBackEntivity>> userGotoSinin(
      {bool? noLoading}) async {
    // dynamic data = {'reissue_date': reissueDate};
    try {
      var response = await Fetch.post(
        '/api/user/qiandaov2',
        // data: data,
        noLoading: noLoading,
      );
      return FetchResponse.completed(
        SininBackEntivity.fromJson(response['data']),
        response,
      );
    } on DioError catch (e) {
      return FetchResponse.error(e);
    }
  }
*/
