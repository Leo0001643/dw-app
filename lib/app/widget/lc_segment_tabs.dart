import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// Creates pills like structured tab bar. See [GFTabBar]
/// [GFSegmentTabs] are best used as an alternative for [GFTabBar].
class LCSegmentTabs extends StatefulWidget {
  /// Creates pills like structured tab bar. See [GFTabBar]
  /// [GFSegmentTabs] are best used as an alternative for [GFTabBar].
  const LCSegmentTabs({
    Key? key,
    required this.length,
    required this.tabs,
    required this.tabController,
    this.height,
    this.width,
    this.border,
    this.borderRadius,
    this.tabBarColor,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
  })  : assert(length != null && length >= 0),
        super(key: key);

  /// The total number of tabs. Typically greater than one. Must match [TabBar.tabs]'s and
  /// [TabBarView.children]'s length.
  final int? length;

  /// Sets [GFSegmentTabs] height
  final double? height;

  /// Sets [TabBar] color using material color [Color]
  final Color? tabBarColor;

  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified, this property is ignored.
  final Color? indicatorColor;

  /// The thickness of the line that appears below the selected tab.
  ///
  /// The value of this parameter must be greater than zero and its default
  /// value is 2.0.
  ///
  /// If [indicator] is specified, this property is ignored.
  final double indicatorWeight;

  /// The horizontal padding for the line that appears below the selected tab.
  ///
  /// For isScrollable tab bars, specifying [kTabLabelPadding] will align
  /// the indicator with the tab's text for [Tab] widgets and all but the
  /// shortest [Tab.text] values.
  ///
  /// The [EdgeInsets.top] and [EdgeInsets.bottom] values of the
  /// [indicatorPadding] are ignored.
  ///
  /// The default value of [indicatorPadding] is [EdgeInsets.zero].
  ///
  /// If [indicator] is specified, this property is ignored.
  final EdgeInsetsGeometry indicatorPadding;

  /// Defines the appearance of the selected tab indicator.
  ///
  /// If [indicator] is specified, the [indicatorColor], [indicatorWeight],
  /// and [indicatorPadding] properties are ignored.
  ///
  /// The default, underline-style, selected tab indicator can be defined with
  /// [UnderlineTabIndicator].
  ///
  /// The indicator's size is based on the tab's bounds. If [indicatorSize]
  /// is [TabBarIndicatorSize.tab] the tab's bounds are as wide as the space
  /// occupied by the tab in the tab bar. If [indicatorSize] is
  /// [TabBarIndicatorSize.label], then the tab's bounds are only as wide as
  /// the tab widget itself.
  final Decoration? indicator;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final TabBarIndicatorSize? indicatorSize;

  /// The color of selected tab labels.
  ///
  /// Unselected tab labels are rendered with the same color rendered at 70%
  /// opacity unless [unselectedLabelColor] is non-null.
  ///
  /// If this parameter is null, then the color of the [ThemeData.primaryTextTheme]'s
  /// body2 text color is used.
  final Color? labelColor;

  /// The color of unselected tab labels.
  ///
  /// If this property is null, unselected tab labels are rendered with the
  /// [labelColor] with 70% opacity.
  final Color? unselectedLabelColor;

  /// The text style of the selected tab labels.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for
  /// both selected and unselected label styles.
  ///
  /// If this property is null, then the text style of the
  /// [ThemeData.primaryTextTheme]'s body2 definition is used.
  final TextStyle? labelStyle;

  /// The padding added to each of the tab labels.
  ///
  /// If this property is null, then kTabLabelPadding is used.
  final EdgeInsetsGeometry? labelPadding;

  /// The text style of the unselected tab labels
  ///
  /// If this property is null, then the [labelStyle] value is used. If [labelStyle]
  /// is null, then the text style of the [ThemeData.primaryTextTheme]'s
  /// body2 definition is used.
  final TextStyle? unselectedLabelStyle;

  /// Typically a list of two or more [Tab] widgets.
  ///
  /// The length of this list must match the controller's [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> tabs;

  /// defines outer border of the tabs
  final Border? border;

  /// defines outer border, border radius
  final BorderRadius? borderRadius;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? tabController;

  /// defines width of the tab row
  final double? width;

  @override
  _LCSegmentTabsState createState() => _LCSegmentTabsState();
}

class _LCSegmentTabsState extends State<LCSegmentTabs> {
  @override
  Widget build(BuildContext context) => Container(
        height: widget.height ?? 28,
        width: widget.width ?? 240,
        decoration: BoxDecoration(
          border:
              widget.border ?? Border.all(color: GFColors.PRIMARY, width: 1),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
        ),
        child: DefaultTabController(
          // initialIndex: widget.initialIndex,
          length: widget.length!,
          child: Material(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
            type: MaterialType.button,
            color: widget.tabBarColor ?? Colors.transparent,
            child: TabBar(
              labelPadding: widget.labelPadding,
              controller: widget.tabController,
              labelColor: widget.labelColor ?? GFColors.WHITE,
              unselectedLabelColor:
                  widget.unselectedLabelColor ?? GFColors.PRIMARY,
              labelStyle: widget.labelStyle ?? const TextStyle(fontSize: 12),
              unselectedLabelStyle:
                  widget.unselectedLabelStyle ?? const TextStyle(fontSize: 12),
              indicatorColor: widget.indicatorColor ?? GFColors.PRIMARY,
              indicatorSize: widget.indicatorSize,
              indicator: widget.indicator ??
                  BoxDecoration(
                    color: widget.indicatorColor ?? GFColors.PRIMARY,
                    border: Border.all(
                        color: widget.indicatorColor ?? Colors.transparent,
                        width: 2),
                    borderRadius: widget.borderRadius == null
                        ? BorderRadius.circular(0)
                        : widget.borderRadius,
                  ),
              indicatorPadding: widget.indicatorPadding,
              indicatorWeight: widget.indicatorWeight,
              tabs: widget.tabs,
              dividerHeight: 0,
            ),
          ),
        ),
      );
}
