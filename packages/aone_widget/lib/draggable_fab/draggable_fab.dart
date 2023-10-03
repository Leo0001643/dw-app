library draggable_fab;

import 'dart:math';

import 'package:flutter/material.dart';

/// Draggable FAB widget which is always aligned to
/// the edge of the screen - be it left,top, right,bottom
class DraggableFab extends StatefulWidget {
  final Widget child;
  final Offset? initPosition;
  final double securityBottom;
  final ValueChanged<Offset>? changed;

  const DraggableFab({
    Key? key,
    required this.child,
    this.initPosition,
    this.securityBottom = 0,
    this.changed,
  }) : super(key: key);

  @override
  _DraggableFabState createState() => _DraggableFabState();
}

class _DraggableFabState extends State<DraggableFab> {
  late Size _widgetSize;

  
  double? _left, _top;
  double _screenWidth = 0.0, _screenHeight = 0.0;
  double? _screenWidthMid, _screenHeightMid;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _getWidgetSize(context));
  }

  void _getWidgetSize(BuildContext context) {
    _widgetSize = context.size!;

    if (widget.initPosition != null) {
      _handleDragEnded(widget.initPosition!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: [
          Positioned(
            left: _left,
            top: _top,
            child: Draggable(
              child: widget.child,
              feedback: widget.child,
              onDragEnd: (draggableDetails) => _handleDragEnded(
                draggableDetails.offset,
              ),
              childWhenDragging: const SizedBox(
                width: 0.0,
                height: 0.0,
              ),
            ),
          )
        ],
      );
    });
  }

  void _handleDragEnded(Offset offset) {
    Size screenSize = MediaQuery.of(context).size;
    _screenWidth = screenSize.width;
    _screenHeight = screenSize.height;
    _screenWidthMid = _screenWidth / 2;
    _screenHeightMid = _screenHeight / 2;

    FabPosition position = AnchorExt.fromOffset(
      offset: offset,
      screenHeight: _screenHeight,
      screenWidth: _screenWidth,
      screenWidthMid: _screenWidthMid!,
      screenHeightMid: _screenHeightMid!,
    ).getPosition(
      widgetSize: _widgetSize,
      targetOffset: offset,
      screenWidth: _screenWidth,
      screenHeight: _screenHeight,
      context: context,
    );
    setState(() {
      _left = position.left;
      _top = position.top;
    });

    if (widget.changed != null) {
      widget.changed!.call(Offset(_left!, _top!));
    }
  }
}

/// #######################################
/// #       |          #        |         #
/// #    TOP_FIRST     #  TOP_SECOND      #
/// # - LEFT_FIRST     #  RIGHT_SECOND -  #
/// #######################################
/// # - LEFT_THIRD     #   RIGHT_FOURTH - #
/// #  BOTTOM_THIRD    #   BOTTOM_FOURTH  #
/// #     |            #       |          #
/// #######################################
enum Anchor {
  leftFirst,
  topFirst,
  rightSecond,
  topSecond,
  leftThird,
  bottomThird,
  rightFourth,
  bottomFourth
}

extension AnchorExt on Anchor {
  static Anchor fromOffset({
    required Offset offset,
    required double screenHeight,
    required double screenWidth,
    required double screenWidthMid,
    required double screenHeightMid,
  }) {
    if (offset.dx < screenWidthMid && offset.dy < screenHeightMid) {
      return offset.dx < offset.dy ? Anchor.leftFirst : Anchor.topFirst;
    } else if (offset.dx >= screenWidthMid && offset.dy < screenHeightMid) {
      return screenWidth - offset.dx < offset.dy
          ? Anchor.rightSecond
          : Anchor.topSecond;
    } else if (offset.dx < screenWidthMid && offset.dy >= screenHeightMid) {
      return offset.dx < screenHeight - offset.dy
          ? Anchor.leftThird
          : Anchor.bottomThird;
    } else {
      return screenWidth - offset.dx < screenHeight - offset.dy
          ? Anchor.rightFourth
          : Anchor.bottomFourth;
    }
  }

  FabPosition getPosition({
    required Size widgetSize,
    required Offset targetOffset,
    required double screenWidth,
    required double screenHeight,
    required BuildContext context,
  }) {
    EdgeInsets padding = MediaQuery.of(context).viewPadding;
    switch (this) {
      case Anchor.leftFirst:
        return FabPosition(
          // widgetSize.width / 2,
          padding.left + 0,
          max(widgetSize.height / 2, targetOffset.dy),
        );
      case Anchor.topFirst:
        return FabPosition(
          max(widgetSize.width / 2, targetOffset.dx),
          (widgetSize.height / 2) + padding.top,
        );
      case Anchor.rightSecond:
        return FabPosition(
          screenWidth - widgetSize.width,
          max(widgetSize.height, targetOffset.dy),
        );
      case Anchor.topSecond:
        return FabPosition(
          min(screenWidth - widgetSize.width, targetOffset.dx),
          (widgetSize.height / 2) + padding.top,
        );
      case Anchor.leftThird:
        return FabPosition(
          0 + padding.left,
          min(screenHeight - widgetSize.height, targetOffset.dy) - padding.bottom,
        );
      case Anchor.bottomThird:
        return FabPosition(
          widgetSize.width / 2,
          (screenHeight - widgetSize.height) - padding.bottom,
        );
      case Anchor.rightFourth:
        return FabPosition(

          screenWidth - widgetSize.width,
          min(screenHeight - widgetSize.height, targetOffset.dy),
        );
      case Anchor.bottomFourth:
        return FabPosition(
          screenWidth - widgetSize.width,
          (screenHeight - widgetSize.height) - padding.bottom,
        );
    }
  }
}

class FabPosition {
  final double left;
  final double top;

  FabPosition(this.left, this.top);
}
