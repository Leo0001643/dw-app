import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/withdraw_theme.dart';

class WithdrawScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onBack;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final bool hideBack;
  final bool transparent;
  final Widget? floatingActionButton;
  Color? backgroundColor;
  final double? elevation;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  WithdrawScaffold(
      {Key? key,
      this.body,
      this.title,
      this.resizeToAvoidBottomInset,
      this.onBack,
      this.appBar,
      this.actions,
      this.hideBack = false,
      this.floatingActionButton,
      this.transparent = false,
      this.backgroundColor,
      this.elevation = 0,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WithdrawTheme _theme = WithdrawTheme();
    final widget = Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      appBar: appBar ??
          AppBar(
            title: Text(
              title ?? "",
              style: WithdrawTheme().appbarTitleStyle,
            ),
            centerTitle: true,
            leading: hideBack
                ? null
                : GestureDetector(
                    onTap: onBack ??
                        () {
                          Get.back();
                        },
                    child: Image.asset(
                      "assets/images/user/back.png",
                      width: 30,
                      height: 30,
                    )),
            flexibleSpace: Container(
              decoration: AoneAppTheme.appTheme.appbarDecorationImage != null
                  ? BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            AoneAppTheme.appTheme.appbarDecorationImage!,
                          )))
                  : AoneAppTheme.appTheme.appbarDecoration,
            ),
            elevation: elevation,
            actions: actions ?? [],
          ),
      backgroundColor: transparent ? Colors.transparent : backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );

    return widget;
  }
}
