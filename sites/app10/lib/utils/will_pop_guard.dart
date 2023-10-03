import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class WillPopGuard extends StatefulWidget {
  final Widget child;

  const WillPopGuard({Key? key, required this.child})
      : super(key: key);

  @override
  WillPopGuardState createState() => WillPopGuardState();
}

class WillPopGuardState extends State<WillPopGuard> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          SmartDialog.showToast('再按一次退出程序',alignment:Alignment.center);
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: widget.child,
    );
  }
}
