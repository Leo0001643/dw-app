part of 'responsive.dart';


class ResponsiveLayout extends StatelessWidget {
  final WidgetBuilder mobileBuilder;
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder desktopBuilder;

  ResponsiveLayout({Key? key,
    required Widget mobile,
    required Widget tablet,
    required Widget desktop,
  })  : mobileBuilder = _makeBuilder(mobile),
        tabletBuilder = _makeBuilder(tablet),
        desktopBuilder = _makeBuilder(desktop), super(key: key);

  ResponsiveLayout.builder({
    Key? key,
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
  });


  static WidgetBuilder _makeBuilder(Widget? widget) {
    return (context) {
      return widget ?? Container();
    };
  }

  @override
  Widget build(BuildContext context) {
    WidgetBuilder builder = ResponsiveValue<WidgetBuilder?>({
      mobileScreenScope: mobileBuilder,
      tabletScreenScope: tabletBuilder,
      desktopScreenScope: desktopBuilder
    }).resolve(context) ??
        desktopBuilder;
    return builder(context);
  }
}