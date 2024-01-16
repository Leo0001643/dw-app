import 'dart:convert';

enum GameKickoutType {
  /// 十分钟没有操作踢人
  noOperateInTenMin(1),

  /// 试玩账户连续十二小时踢人
  timeOverTwelve(2),

  /// 无效玩家踢人
  invalidPlayer(3),

  /// 系统处于维护状态
  systemInMaintenance(4),

  /// 多设备登录
  multiConnect(5),

  ///停机维护
  sysServerInMaintenance(6);

  final int number;

  const GameKickoutType(this.number);
}

// 多状态协同

enum GameDissolveStatus {
  // ignore: constant_identifier_names
  forceDissolve(0), // "强制解散"
  houseDissolve(1), //, "房间内解散"
  overtimeDissolve(2), // , "服务端超时自动解散"
  normalEndDissolve(3), // , "正常结束"
  gameOverDissolve(4), //  "游戏端超时自动解散"
  showdownMaintenanceDissolve(5); // "停机维护强制解散")

  final int number;
  const GameDissolveStatus(this.number);
}

/// 响应类型
enum GameResponseType {
  /// 顶层心跳响应
  heartBeatTop(1),

  /// 服务器切换子节点【子心跳】
  heartBeat(3),

  /// 踢人通知
  kickout(99),

  /// 服务器升级（服务器下发消息）
  serverUpgradeStart(3064),

  /// 服务器升级结束（客户端模拟消息）
  serverUpgradeEnd(3065),

  /// 入座通知
  takeSeatNotice(10001),

  /// 通知房主开始游戏通知
  noticeRoomHolder(10002),

  /// 发牌
  dealCard(10003),

  /// 玩家结算通知
  clearing(10004),

  /// 通知下注
  betNotice(10005),

  /// 弃牌，已废弃
  fold(10006),

  /// 站起
  standUp(10007),

  /// 退出
  exit(10008),

  /// 筹码变更
  chipChanged(10009),

  /// 解散房间通知
  disband(10010),

  /// 更新边池数据通知
  updateSidePot(10011),

  /// 回到座位通知（留座离桌状态）
  backSeatNotice(10012),

  /// 留座离桌通知
  keepSeatLeaveTable(10013),

  /// 开始游戏通知
  startGameNotice(10014),

  /// 实时账单 观众列表更新
  realBillWatcherUpdateNotice(10015),

  /// 实时账单 玩家列表更新
  realBillUserUpdateNotice(10016),

  /// 用户自主亮牌通知
  userOwnShowCardNotice(10017),

  /// 强制亮牌通知
  userForceShowCardNotice(10018),

  /// 返还无效边池通知
  returnInvalidPotNotice(10019),

  /// 用户牌型提示通知
  userCardTypeNotice(10020),

  /// 更新下注状态
  updateBetStatusNotice(10021),

  ///结算补码弹框通知
  gameSettleGetMoreMoney(10022),

  /// 弱网提示通知
  weakNetNotice(10023),

  /// 牌局异常通知，需要结束这一手
  gameAnomalyNotice(10028),

  /// 玩家投保通知（给玩家和旁观者发）
  insureBuyNotifycation(10024),

  /// 玩家投保金额状态通知（给玩家和旁观者发）
  insureOtherBuyNotifycation(10025),

  /// 保险赔付记录列表
  insureListNotifycation(10026),

  /// 延迟时间
  insureTimeNotifycation(10027),

  /// 停機維護
  sysMaintenanceNotifycation(10029),

  /// 清理牌桌
  resetTableData(10030),

  /// 带出主动通知
  takeoutNotifycation(10031),

  ///11001大厅钱包金融变化通知
  clubWalletAmountICN(11001),

  ///11002大厅俱乐部信息变化通知
  clubICN(11002),

  ///11003大厅牌桌变更通知
  clubCardTableICN(11003),

  ///11004大厅牌桌入座人数变更通知
  clubTableICN(11004),

  ///11005大厅用户基本信息变更
  clubUserInfoICN(11005),

  /// 以下是聊天相关通知状态码

  // 加入聊天室通知
  joinChatRoom(12000),

  // 发送桌内聊天内容通知
  sendChatContent(12001),

  // 延迟下注通知 1.3.7
  delayBet(10033);

  final int number;

  const GameResponseType(this.number);
}

/// 响应错误码
enum GameResponseErrorCode {
  // 未连接成功
  unreachable(404),

  /// 系统维护
  serverRepair(2000),

  /// 超时
  timeout(3017),

  /// 牌桌已解散
  tableClose(3032),

  // 禁止进入游戏
  forbiddenGame(3054),

  /// 本来在房间内，重新进来异常码
  reEnterRoom(3056),

  /// 服务器重启
  serverRestart(3063),

  /// 服务器升级
  serverUpdate(3064),

  /// 当前不需要自主亮牌 1.3.0
  showcardNotAllow(3072),

  /// 已亮牌无法取消
  showCardAlready(3073),

  /// 主动带出关闭
  takeoutClose(3074),

  /// 带出金额不正确 1.3.0
  takeoutValueError(3075),

  /// 带出配置信息为NULL 1.3.0
  takeoutMsgNull(3076),

  /// 非站起状态不可带出筹码 1.3.0
  takeoutUnStand(3077),

  ///  需要重新请求加入聊天室协议 1.3.1
  joinChatRoom(3083),

  /// 自动取消（如长连接断开）
  autoCancel(999);

  final int number;

  const GameResponseErrorCode(this.number);
}

class GameResponse {
  /// 状态码
  late int code;

  /// 消息提示
  late String? msg;

  /// 响应数据，json对象
  late dynamic data;

  /// 协议类型
  late int responseTypeId = 0;

  /// 区分 德州/短牌 ，默认是德州 1
  int serviceTypeId = 1;

  GameResponse();

  GameResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    msg = json["msg"];
    responseTypeId = json["responseTypeId"];
    serviceTypeId = json["serviceTypeId"];
  }
  String messageId="";
  String responseKey() {
    if (messageId != null) {
      return "$responseTypeId-$messageId";
    }
    return "$responseTypeId";
  }
}

