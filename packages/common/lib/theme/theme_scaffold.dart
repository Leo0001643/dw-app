import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onBack;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final bool hideBack;
  final bool transparent;
  final Widget? floatingActionButton;
  final Color backgroundColor;
  final double? elevation;
  final Widget? bottomNavigationBar;
  final LinearGradient? linearGradient;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const ThemeScaffold(
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
      this.backgroundColor = const Color(0xffffffff),
      this.elevation = 0,
      this.bottomNavigationBar,
      this.linearGradient,
      this.floatingActionButtonLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      appBar: appBar ??
          AppBar(
            title: Text(
              title ?? "",
              style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
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
              decoration:  BoxDecoration(
                gradient: linearGradient ?? LinearGradient(colors: [
                  Color(0xFF13805E),
                  Color(0XFF06C285),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
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

    // return transparent
    //     ? widget
    //     : BackgroundWrapper(
    //         child: widget,
    //       );
  }
}

