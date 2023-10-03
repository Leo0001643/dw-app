import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuardBuilder extends StatelessWidget {
  final WidgetBuilder regularBuilder;
  final WidgetBuilder visitorBuilder;

  const AuthGuardBuilder({
    Key? key,
    required this.regularBuilder,
    required this.visitorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _authLevel = UserService.to.state.authLevel;
      if ((_authLevel == AuthLevel.regular) | (_authLevel == AuthLevel.trial)) {
        return regularBuilder(context);
      } else {
        return visitorBuilder(context);
      }
    });
  }
}
