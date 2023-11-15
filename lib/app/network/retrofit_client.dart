
import 'dart:collection';

import 'package:dio/dio.dart' hide Headers;
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/base_response_entity.dart';
import 'package:leisure_games/ui/bean/bonus_total_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';
import 'package:leisure_games/ui/bean/domain_config_entity.dart';
import 'package:leisure_games/ui/bean/expression_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/member_point_entity.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/bean/phrase_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';
import 'package:leisure_games/ui/bean/promotion_detail_entity.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';
import 'package:leisure_games/ui/bean/trend_response_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: 'http://soptj9qq.com:8860/',parser: Parser.JsonSerializable)
abstract class RetrofitClient{

  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;

  @GET('/ds-api-web/getGameKind')
  Future<BaseResponseEntity<List<GameKindEntity>>> getGameKind();

  @GET('/ds-api-web/getNotice')
  Future<BaseResponseEntity<List<NoticeEntity>>> getNotice(@Query('noteType') int noteType,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<List<Pic30Entity>>> getRotate(@Field('classify') String classify,
      @Field('imageType') int imageType,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<Pic30BackEntity>> getActPic(@Field('classify') String classify,
      @Field('imageType') int imageType,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<PromotionTypeEntity>> getPromotionTpe(@Field('classify') String classify,
      @Field('imageType') int imageType,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<PromotionDetailEntity>> getPromotionDetail(@Field('classify') String classify,
      @Field('tag') String tag,@Field('imageType') int imageType,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<NewsRateEntity>> getNewsRate(@Field('classify') String classify,
      @Field('tag') String tag,@Field('imageType') int imageType,);

  @POST('/ds-api-web/getActStatus')
  Future<BaseResponseEntity<ActStatusEntity>> getActStatus();

  @POST('/ds-api-web/protect')
  Future<BaseResponseEntity<ProtectEntity>> protect();

  @GET('/ds-api-web/getGameType')
  Future<BaseResponseEntity<List<GameTypeEntity>>> getGameType();

  @GET('/ds-api-web/getCustomerService')
  Future<BaseResponseEntity<List<CustomerServiceEntity>>> getCustomerService();

  @GET('/ds-api-web/getPc28LottoList')
  Future<BaseResponseEntity<Pc28LottoEntity>> getPc28LottoList();

  @POST('/ds-api-web/getWebConfig')
  Future<BaseResponseEntity<WebConfigEntity>> getWebConfig();

  @POST('/ds-api-web/getDomainConfig')
  Future<BaseResponseEntity<DomainConfigEntity>> getDomainConfig();

  @GET('https://api.j7oum3yp.com/Infos/HistoryHall')
  Future<TrendResponseEntity<String>> historyHall();

  @GET('https://api.j7oum3yp.com/Infos/HistoryList')
  Future<TrendResponseEntity<List<HistoryLottoEntity>>> historyList(@Query('lid') int lid,@Query('pageIndex') int pageIndex,@Query('pageSize') int pageSize,);

  @GET('/ds-api-web/getDewInfo')
  Future<BaseResponseEntity<DewInfoEntity>> getDewInfo(@Query('gameType') String gameType,@Query('countTerm') String countTerm,@Query('lotteryVersion')String lotteryVersion,);

  @GET('/ds-api-web/getRoomCopyWriting')
  Future<BaseResponseEntity<List<RoomCopyWritingEntity>>> getRoomCopyWriting();

  @GET('/ds-api-web/getPC28Plan')
  Future<BaseResponseEntity<Pc28PlanEntity>> getPC28Plan(@Query('termCount') int termCount,);

  @GET('/ds-api-web/getExpression')
  Future<BaseResponseEntity<List<ExpressionEntity>>> getExpression();

  @GET('/ds-api-web/getPhrase')
  Future<BaseResponseEntity<List<PhraseEntity>>> getPhrase();

  @GET('/ds-api-web/getPC28Odds')
  Future<BaseResponseEntity<String>> getPC28Odds(@Query('id') int id,);

  @POST('/ds-api-web/login')
  Future<BaseResponseEntity<LoginUserEntity>> login(@Body() Map<String,dynamic> params,);


  @GET('/ds-api-web/getBalance')
  Future<BaseResponseEntity<BalanceEntity>> getBalance(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/queryBonus')
  Future<BaseResponseEntity<BonusTotalEntity>> queryBonus(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/queryMemberPoint')
  Future<BaseResponseEntity<MemberPointEntity>> queryMemberPoint(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getPaymentList')
  Future<BaseResponseEntity<PaymentListEntity>> getPaymentList(@Query('oid') String oid,@Query('username') String username,);












}


