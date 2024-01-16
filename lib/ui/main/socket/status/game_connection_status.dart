/// 长连接状态
enum ConnectStatus {
  none,
  connecting,
  connected,
  disconnecting,
  disconnected,
  failed,
  emptyUrl, // 空地址，主要是账号为空导致的
}