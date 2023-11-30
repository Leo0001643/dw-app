// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RetrofitClient implements RetrofitClient {
  _RetrofitClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://soptj9qq.com:8860/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponseEntity<List<GameKindEntity>>> getGameKind() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<GameKindEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getGameKind',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<GameKindEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<GameKindEntity>(
                  (i) => GameKindEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<NoticeEntity>>> getNotice(int noteType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'noteType': noteType};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<NoticeEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getNotice',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<NoticeEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<NoticeEntity>(
                  (i) => NoticeEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<Pic30Entity>>> getRotate(
    String classify,
    int imageType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'classify': classify,
      'imageType': imageType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<Pic30Entity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPic30',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<Pic30Entity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<Pic30Entity>(
                  (i) => Pic30Entity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<Pic30BackEntity>> getActPic(
    String classify,
    int imageType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'classify': classify,
      'imageType': imageType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<Pic30BackEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPic30',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<Pic30BackEntity>.fromJson(
      _result.data!,
      (json) => Pic30BackEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<PromotionTypeEntity>> getPromotionTpe(
    String classify,
    int imageType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'classify': classify,
      'imageType': imageType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<PromotionTypeEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPic30',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<PromotionTypeEntity>.fromJson(
      _result.data!,
      (json) => PromotionTypeEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<PromotionDetailEntity>> getPromotionDetail(
    String classify,
    String tag,
    int imageType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'classify': classify,
      'tag': tag,
      'imageType': imageType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<PromotionDetailEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPic30',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<PromotionDetailEntity>.fromJson(
      _result.data!,
      (json) => PromotionDetailEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<NewsRateEntity>> getNewsRate(
    String classify,
    String tag,
    int imageType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'classify': classify,
      'tag': tag,
      'imageType': imageType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<NewsRateEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPic30',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<NewsRateEntity>.fromJson(
      _result.data!,
      (json) => NewsRateEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<ActStatusEntity>> getActStatus() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<ActStatusEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getActStatus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<ActStatusEntity>.fromJson(
      _result.data!,
      (json) => ActStatusEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<ProtectEntity>> protect() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<ProtectEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/protect',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<ProtectEntity>.fromJson(
      _result.data!,
      (json) => ProtectEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<GameTypeEntity>>> getGameType() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<GameTypeEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getGameType',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<GameTypeEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<GameTypeEntity>(
                  (i) => GameTypeEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<CustomerServiceEntity>>>
      getCustomerService() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<CustomerServiceEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getCustomerService',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<CustomerServiceEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CustomerServiceEntity>((i) =>
                  CustomerServiceEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<Pc28LottoEntity>> getPc28LottoList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<Pc28LottoEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPc28LottoList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<Pc28LottoEntity>.fromJson(
      _result.data!,
      (json) => Pc28LottoEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<WebConfigEntity>> getWebConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<WebConfigEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getWebConfig',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<WebConfigEntity>.fromJson(
      _result.data!,
      (json) => WebConfigEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DomainConfigEntity>> getDomainConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DomainConfigEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getDomainConfig',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DomainConfigEntity>.fromJson(
      _result.data!,
      (json) => DomainConfigEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<TrendResponseEntity<String>> historyHall() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrendResponseEntity<String>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://api.j7oum3yp.com/Infos/HistoryHall',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TrendResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<TrendResponseEntity<List<HistoryLottoEntity>>> historyList(
    int lid,
    int pageIndex,
    int pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lid': lid,
      r'pageIndex': pageIndex,
      r'pageSize': pageSize,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrendResponseEntity<List<HistoryLottoEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://api.j7oum3yp.com/Infos/HistoryList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TrendResponseEntity<List<HistoryLottoEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<HistoryLottoEntity>(
                  (i) => HistoryLottoEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DewInfoEntity>> getDewInfo(
    String gameType,
    String countTerm,
    String lotteryVersion,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'gameType': gameType,
      r'countTerm': countTerm,
      r'lotteryVersion': lotteryVersion,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DewInfoEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getDewInfo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DewInfoEntity>.fromJson(
      _result.data!,
      (json) => DewInfoEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<RoomCopyWritingEntity>>>
      getRoomCopyWriting() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<RoomCopyWritingEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getRoomCopyWriting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<RoomCopyWritingEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RoomCopyWritingEntity>((i) =>
                  RoomCopyWritingEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<Pc28PlanEntity>> getPC28Plan(int termCount) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'termCount': termCount};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<Pc28PlanEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPC28Plan',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<Pc28PlanEntity>.fromJson(
      _result.data!,
      (json) => Pc28PlanEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<ExpressionEntity>>> getExpression() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<ExpressionEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getExpression',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<ExpressionEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ExpressionEntity>(
                  (i) => ExpressionEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<PhraseEntity>>> getPhrase() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<PhraseEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPhrase',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<PhraseEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PhraseEntity>(
                  (i) => PhraseEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> getPC28Odds(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPC28Odds',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<LoginUserEntity>> login(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<LoginUserEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<LoginUserEntity>.fromJson(
      _result.data!,
      (json) => LoginUserEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<BalanceEntity>> getBalance(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<BalanceEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getBalance',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<BalanceEntity>.fromJson(
      _result.data!,
      (json) => BalanceEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<BonusTotalEntity>> queryBonus(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<BonusTotalEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/queryBonus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<BonusTotalEntity>.fromJson(
      _result.data!,
      (json) => BonusTotalEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<MemberPointEntity>> queryMemberPoint(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<MemberPointEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/queryMemberPoint',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<MemberPointEntity>.fromJson(
      _result.data!,
      (json) => MemberPointEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<PaymentListEntity>> getPaymentList(
    String oid,
    String username,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'oid': oid,
      r'username': username,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<PaymentListEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPaymentList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<PaymentListEntity>.fromJson(
      _result.data!,
      (json) => PaymentListEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<VarCodeEntity>> getVarcode(String channel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'channel': channel};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<VarCodeEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getVarcode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<VarCodeEntity>.fromJson(
      _result.data!,
      (json) => VarCodeEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> memberRegCheck(String realName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'realName': realName};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/memberRegCheck',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<LoginUserEntity>> userRegister(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<LoginUserEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/userRegister',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<LoginUserEntity>.fromJson(
      _result.data!,
      (json) => LoginUserEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<MessageItemEntity>>> getMessage(
    String oid,
    String username,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'oid': oid,
      r'username': username,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<MessageItemEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getMessage',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<MessageItemEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MessageItemEntity>(
                  (i) => MessageItemEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DigiccyChannelEntity>> getOnlineDigiccyChannel(
    String oid,
    String username,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'oid': oid,
      r'username': username,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DigiccyChannelEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getOnlineDigiccyChannel',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DigiccyChannelEntity>.fromJson(
      _result.data!,
      (json) => DigiccyChannelEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<PaymentChannelEntity>> getPaymentChannel(
    String oid,
    String username,
    String bankCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'oid': oid,
      r'username': username,
      r'bankCode': bankCode,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<PaymentChannelEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPaymentChannel',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<PaymentChannelEntity>.fromJson(
      _result.data!,
      (json) => PaymentChannelEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> digiccyDeposit(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DigiccyDepositDataEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/digiccyDeposit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DigiccyDepositDataEntity>.fromJson(
      _result.data!,
      (json) => DigiccyDepositDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> companyDeposit(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DigiccyDepositDataEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/companyDeposit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DigiccyDepositDataEntity>.fromJson(
      _result.data!,
      (json) => DigiccyDepositDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<BankEntity>>> getBanks(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<BankEntity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getBanks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<BankEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<BankEntity>(
                  (i) => BankEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> onlineDeposit(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<DigiccyDepositDataEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/onlineDeposit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<DigiccyDepositDataEntity>.fromJson(
      _result.data!,
      (json) => DigiccyDepositDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<DepositLogEntity>>> queryDepositLog(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<DepositLogEntity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/queryDepositLog',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<DepositLogEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<DepositLogEntity>(
                  (i) => DepositLogEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<PaymentListBanks>>> queryDepositType(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<PaymentListBanks>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/queryDepositType',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<PaymentListBanks>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PaymentListBanks>(
                  (i) => PaymentListBanks.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> updateUserAvatar(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/updateUserAvatar',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> internalTransfer(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/internalTransfer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<IsPermitEntity>>> getPlatformIsPermit(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<IsPermitEntity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPlatformIsPermit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<IsPermitEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<IsPermitEntity>(
                  (i) => IsPermitEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<PlatformEntity>>> getPlatformList(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<PlatformEntity>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getPlatformList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<PlatformEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PlatformEntity>(
                  (i) => PlatformEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> transfer(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/transfer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<UserDrawDetailEntity>> getUserDrawDetail(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<UserDrawDetailEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getUserDrawDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<UserDrawDetailEntity>.fromJson(
      _result.data!,
      (json) => UserDrawDetailEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<WithdrawCheckEntity>> withdrawCheck(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<WithdrawCheckEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/withdrawCheck',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<WithdrawCheckEntity>.fromJson(
      _result.data!,
      (json) => WithdrawCheckEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<SiteWalletConfigEntity>>> getSiteWalletConfig(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<SiteWalletConfigEntity>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/ds-api-web/getSiteWalletConfig',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseResponseEntity<List<SiteWalletConfigEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<SiteWalletConfigEntity>((i) =>
                  SiteWalletConfigEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> takeSubmit(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/takeSubmit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<FlowDataEntity>> sys800(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<FlowDataEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/sys800',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<FlowDataEntity>.fromJson(
      _result.data!,
      (json) => FlowDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> changeGetpassword(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/changeGetpassword',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> bindDrawDetail(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/bindDrawDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<List<UsdtChannelEntity>>> getVMDrawDetail(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<List<UsdtChannelEntity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getVMDrawDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<List<UsdtChannelEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<UsdtChannelEntity>(
                  (i) => UsdtChannelEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<String>> bindVMDrawDetail(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/bindVMDrawDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<BetRecordGroupEntity>> getRecordGroupDay(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<BetRecordGroupEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/getRecordGroupDay',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<BetRecordGroupEntity>.fromJson(
      _result.data!,
      (json) => BetRecordGroupEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponseEntity<PointRecordEntity>> queryPointLog(
      Map<String, dynamic> params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponseEntity<PointRecordEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ds-api-web/queryPointLog',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponseEntity<PointRecordEntity>.fromJson(
      _result.data!,
      (json) => PointRecordEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
