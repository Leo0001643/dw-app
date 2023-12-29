///登录后通知各页面刷新
///余额变化通知各页面刷新
class LoginRefreshEvent {
  bool show_notice;

  LoginRefreshEvent({this.show_notice = false});
}

