
import '../game_request.dart';

class LoginRequest extends GameRequest {
  String? table_id;
  String? room_id;

  String? game_type;
  LoginRequest({this.table_id,this.room_id,this.game_type})
      : super("login");

  @override
  Map<String, dynamic>? requestParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["table_id"] = table_id; // 房间id
    params["game_type"] = game_type; // 房间id
    params["room_id"] = room_id; // 房间id
    return params;
  }
}
