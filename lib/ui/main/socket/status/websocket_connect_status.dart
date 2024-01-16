/// 长连接状态
enum WebSocketConnectStatus {
  none,
  connecting,
  connected,
  timeout,
  disconnected,
  logout,
  failed,
  close,
}
