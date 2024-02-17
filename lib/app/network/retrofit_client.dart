
import 'package:dio/dio.dart' hide Headers;
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';
import 'package:leisure_games/ui/bean/base_response_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';
import 'package:leisure_games/ui/bean/bet_shake_entity.dart';
import 'package:leisure_games/ui/bean/bonus_total_entity.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';
import 'package:leisure_games/ui/bean/check_in_info_entity.dart';
import 'package:leisure_games/ui/bean/check_point_entity.dart';
import 'package:leisure_games/ui/bean/chess_info_entity.dart';
import 'package:leisure_games/ui/bean/constitute_ratio_entity.dart';
import 'package:leisure_games/ui/bean/current_bet_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';
import 'package:leisure_games/ui/bean/deposit_log_entity.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';
import 'package:leisure_games/ui/bean/domain_config_entity.dart';
import 'package:leisure_games/ui/bean/draw_lottery_entity.dart';
import 'package:leisure_games/ui/bean/ds_game_entity.dart';
import 'package:leisure_games/ui/bean/ele_game_type_entity.dart';
import 'package:leisure_games/ui/bean/expression_entity.dart';
import 'package:leisure_games/ui/bean/flow_data_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/help_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:leisure_games/ui/bean/is_permit_entity.dart';
import 'package:leisure_games/ui/bean/login_game_agent_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/member_point_entity.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/bean/phrase_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';
import 'package:leisure_games/ui/bean/point_record_entity.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';
import 'package:leisure_games/ui/bean/promotion_detail_entity.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';
import 'package:leisure_games/ui/bean/shake_info_entity.dart';
import 'package:leisure_games/ui/bean/site_wallet_config_entity.dart';
import 'package:leisure_games/ui/bean/spread_promos_data_entity.dart';
import 'package:leisure_games/ui/bean/spread_user_entity.dart';
import 'package:leisure_games/ui/bean/trend_response_entity.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/user_detail_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';
import 'package:leisure_games/ui/bean/wallet_draw_detail_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: Constants.base_url,parser: Parser.JsonSerializable)
abstract class RetrofitClient{

  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;

  ///公告类型【公告类型，1普通公告(主站)-11普通公告(副站)，2跳弹公告(主站)-21跳弹公告(副站)】
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


  @GET('/ds-api-web/getGameKind')
  Future<BaseResponseEntity<List<GameKindEntity>>> getGameKind();


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
  Future<BaseResponseEntity<DewInfoEntity>> getDewInfo(@Queries() Map<String,dynamic> params,);

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

  @GET('/ds-api-web/getVarcode')
  Future<BaseResponseEntity<VarCodeEntity>> getVarcode(@Query('channel') String channel,);

  @POST('/ds-api-web/memberRegCheck')
  Future<BaseResponseEntity<String>> memberRegCheck(@Field('realName') String realName,);

  @POST('/ds-api-web/userRegister')
  Future<BaseResponseEntity<LoginUserEntity>> userRegister(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getMessage')
  Future<BaseResponseEntity<List<MessageItemEntity>>> getMessage(@Query('oid') String oid,@Query('username') String username,);

  @GET('/ds-api-web/getOnlineDigiccyChannel')
  Future<BaseResponseEntity<DigiccyChannelEntity>> getOnlineDigiccyChannel(@Query('oid') String oid,@Query('username') String username,);

  @GET('/ds-api-web/getPaymentChannel')
  Future<BaseResponseEntity<PaymentChannelEntity>> getPaymentChannel(@Query('oid') String oid,
      @Query('username') String username,@Query('bankCode') String bankCode,);

  @POST('/ds-api-web/digiccyDeposit')
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> digiccyDeposit(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/companyDeposit')
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> companyDeposit(@Body() Map<String,dynamic> params,);

  ///type:列表类型【1:表示所有银行,2:表示出款银行(排除扫码银行)】
  @POST('/ds-api-web/getBanks')
  Future<BaseResponseEntity<List<BankEntity>>> getBanks(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/onlineDeposit')
  Future<BaseResponseEntity<DigiccyDepositDataEntity>> onlineDeposit(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/queryDepositLog')
  Future<BaseResponseEntity<List<DepositLogEntity>>> queryDepositLog(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/queryDepositType')
  Future<BaseResponseEntity<List<PaymentListBanks>>> queryDepositType(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/updateUserAvatar')
  Future<BaseResponseEntity<String>> updateUserAvatar(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/internalTransfer')
  Future<BaseResponseEntity<String>> internalTransfer(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getPlatformIsPermit')
  Future<BaseResponseEntity<List<IsPermitEntity>>> getPlatformIsPermit(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getPlatformList')
  Future<BaseResponseEntity<List<PlatformEntity>>> getPlatformList(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/transfer')
  Future<BaseResponseEntity<String>> transfer(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getUserDrawDetail')
  Future<BaseResponseEntity<UserDrawDetailEntity>> getUserDrawDetail(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/withdrawCheck')
  Future<BaseResponseEntity<WithdrawCheckEntity>> withdrawCheck(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getSiteWalletConfig')
  Future<BaseResponseEntity<List<SiteWalletConfigEntity>>> getSiteWalletConfig(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/takeSubmit')
  Future<BaseResponseEntity<String>> takeSubmit(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/sys800')
  Future<BaseResponseEntity<FlowDataEntity>> sys800(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/changeGetpassword')
  Future<BaseResponseEntity<String>> changeGetpassword(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/bindDrawDetail')
  Future<BaseResponseEntity<String>> bindDrawDetail(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getDigitalWalletDrawDetail')
  Future<BaseResponseEntity<WalletDrawDetailEntity>> getVMDrawDetail(@Body() Map<String,dynamic> params,);


  @POST('/ds-api-web/bindDigitalWallet')
  Future<BaseResponseEntity<String>> bindVMDrawDetail(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getRecordGroupDay')
  Future<BaseResponseEntity<BetRecordGroupEntity>> getRecordGroupDay(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getRecordGroupType')
  Future<BaseResponseEntity<BetDetailItemEntity>> getRecordGroupType(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getRecordDetailNew')
  Future<BaseResponseEntity<BetDetailItemChildEntity>> getRecordDetailNew(@Body() Map<String,dynamic> params,);



  @GET('/ds-api-web/queryPointLog')
  Future<BaseResponseEntity<PointRecordEntity>> queryPointLog(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/backWaterTotal')
  Future<BaseResponseEntity<List<BackWaterEntity>>> backWaterTotal(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<BackWaterDescEntity>> getNewsBack(@Field('classify') String classify,
      @Field('tag') String tag,@Field('imageType') int imageType,);

  @GET('/ds-api-web/queryConstituteRatio')
  Future<BaseResponseEntity<ConstituteRatioEntity>> queryConstituteRatio(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/dayReturnWaterDetails')
  Future<BaseResponseEntity<DayReturnWaterDetailsEntity>> dayReturnWaterDetails(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getPrize')
  Future<BaseResponseEntity<PrizeListEntity>> getPrize(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getSpreadUser')
  Future<BaseResponseEntity<List<SpreadUserEntity>>> getSpreadUser(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getSpreadPromos')
  Future<BaseResponseEntity<SpreadPromosDataEntity>> getSpreadPromos(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/checkAgentReg')
  Future<BaseResponseEntity<String>> checkAgentReg(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/agentRegister')
  Future<BaseResponseEntity<String>> agentRegister(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/getPic30')
  Future<BaseResponseEntity<List<HelpEntity>>> getHelpCenter(@Field('classify') String classify,
      @Field('imageType') int imageType,);

  @GET('/ds-api-web/getUserDetail')
  Future<BaseResponseEntity<UserDetailEntity>> getUserDetail(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/updateUserDetail')
  Future<BaseResponseEntity<String>> updateUserDetail(@Body() Map<String,dynamic> params,);

  @POST('ds-api-web/changePassword')
  Future<BaseResponseEntity<String>> changePassword(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getBtcSource')
  Future<BaseResponseEntity<List<BtcSourceEntity>>> getBtcSource(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getGameCurrentBet')
  Future<BaseResponseEntity<CurrentBetEntity>> getGameCurrentBet(@Queries() Map<String,dynamic> params,);

  @GET('/ds-api-web/getDrawLotteryData')
  Future<BaseResponseEntity<List<DrawLotteryEntity>>> getDrawLotteryData(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/loginBusinessAgent')
  Future<BaseResponseEntity<dynamic>> loginBusinessAgent(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getChessList')
  Future<BaseResponseEntity<List<ChessInfoEntity>>> getChessList(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/getGameTypeList')
  Future<BaseResponseEntity<List<EleGameTypeEntity>>> getGameTypeList(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/dsgame')
  Future<BaseResponseEntity<DsGameEntity>> getDsgame(@Body() Map<String,dynamic> params,);

  @POST('/ds-api-web/gameFav')
  Future<BaseResponseEntity<String>> gameFav(@Body() Map<String,dynamic> params,);


  @GET('/ds-api-web/queryCheckInInfo')
  Future<BaseResponseEntity<CheckInInfoEntity>> queryCheckInInfo(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/checkInPoint')
  Future<BaseResponseEntity<CheckPointEntity>> checkInPoint(@Body() Map<String,dynamic> params,);

  @GET('/ds-api-web/getShakeInfo')
  Future<BaseResponseEntity<ShakeInfoEntity>> getShakeInfo(@Queries() Map<String,dynamic> params,);

  @POST('/ds-api-web/betShake')
  Future<BaseResponseEntity<List<BetShakeEntity>>> betShake(@Queries() Map<String,dynamic> params,);


























}





















