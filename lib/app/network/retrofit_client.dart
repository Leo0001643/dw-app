
import 'package:dio/dio.dart' hide Headers;
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/base_response_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: 'http://soptj9qq.com:8860/')
abstract class RetrofitClient{

  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;


  @GET('/ds-api-web/getGameType')
  Future<BaseResponseEntity<List<GameTypeEntity>>> getGameType();




}


