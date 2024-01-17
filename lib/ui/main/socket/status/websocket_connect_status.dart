/// 长连接状态
enum WebSocketConnectStatus {
  none, // 初始化
  emptyUrl, // 空url
  errorUrl, // 主机域名异常
  connecting, // 正在连接中
  connected, // 连接完成
  reconnect, // 重连
  timeout, // 超时
  disconnecting, // 断开连接中
  disconnected, // 已经断开连接
  logout, // 登出
  failed, // 网络异常
  close, // 网络关闭
}
