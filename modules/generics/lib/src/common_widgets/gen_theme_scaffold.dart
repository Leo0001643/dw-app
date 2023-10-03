import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GenThemeScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onBack;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final bool hideBack;
  final bool transparent;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? leading;
  final Gradient? gradient;

  const GenThemeScaffold(
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
      this.floatingActionButtonLocation,
      this.gradient,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = AnnotatedRegion(
      value: (SystemUiOverlayStyle.dark),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        appBar: appBar ??
            AppBar(
              title: Text(
                title ?? "",
                style: const TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
              ),
              centerTitle: true,
              leading: hideBack
                  ? leading
                  : GestureDetector(
                      onTap: onBack ??
                          () {
                            Get.back();
                          },
                      child: Image.asset("assets/images/common/back.png",
                          width: 30, height: 30, package: 'generics')),
              flexibleSpace: Container(
                decoration: AoneAppTheme.appTheme.appbarDecoration ??
                    BoxDecoration(color: Colors.white, gradient: gradient),
              ),
              elevation: elevation,
              actions: actions ?? [],
            ),
        backgroundColor: transparent
            ? Colors.transparent
            : backgroundColor ?? AoneAppTheme.appTheme.backgroundColor,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );

    return widget;
  }
}
