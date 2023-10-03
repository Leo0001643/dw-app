import 'package:aone_common/utils/colors.dart';
import 'package:app10/theme/background_wrapper.dart';
import 'package:app10/theme/color_schema.dart';
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
  final Color? backgroundColor;
  final double? elevation;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? leading;
  final Gradient? gradient;

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
      this.backgroundColor,
      this.elevation = 0,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.gradient,
      this.leading})
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
                    child: Image.asset(
                      "assets/images/user/back.png",
                      width: 30,
                      height: 30,
                    )),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryOne,
                gradient: gradient,
              ),
            ),
            elevation: elevation,
            actions: actions ?? [],
          ),
      backgroundColor: transparent
          ? Colors.transparent
          : backgroundColor ?? AppTheme.primaryOne,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );

    return transparent
        ? widget
        : BackgroundWrapper(
            child: widget,
          );
  }
}

/*  保留后用
class _BarBaseViewState extends State<BarBaseView> {
  // BarBaseView(
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().statusBarHeight + 44,
      decoration: const BoxDecoration(
          image: DecorationImage(
              //assets/images/activity/app_bar_ground.png
              // image: AssetImage('assets/images/common/app_bar_ground.png'))),
              image: AssetImage('assets/images/common/app_bar_ground.png'),
              fit: BoxFit.fill)),
      child: _barView(),
    );
  }

  _barView() {
    return Container(
      height: 20,
      margin: EdgeInsets.only(
          top: 49,
          left: ScreenUtil().setWidth(14),
          right: ScreenUtil().setWidth(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/home/back_icon.png'),
          ),
          Text(widget.title,
              style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          // const Spacer(),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}

*/
