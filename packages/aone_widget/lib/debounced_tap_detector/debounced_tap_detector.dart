import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';


class DebouncedTapDetector extends StatefulWidget {
  final Function()? onTap;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final Function()? onTapCancel;
  final Duration? duration;
  final Widget? child;

  const DebouncedTapDetector({
    Key? key,
    this.onTap,
    this.duration,
    this.child,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
  }) : super(key: key);

  @override
  State<DebouncedTapDetector> createState() =>
      _DebouncedTapDetectorState();
}

class _DebouncedTapDetectorState extends State<DebouncedTapDetector> {

  late final Debouncer _debouncer;

  bool asyncLooker = false;

  @override
  void initState() {
    _debouncer = Debouncer(
      delay: widget.duration ?? const Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onTap: () => _debouncer.call(() async {
        if (widget.onTap == null || asyncLooker == true) {
          return;
        }

        // 异步方法而外锁
        if (widget.onTap is Future Function()) {
          asyncLooker = true;
          await widget.onTap!();
          Future.delayed(widget.duration ?? const Duration(milliseconds: 200), () => asyncLooker = false);
          return;
        }
        widget.onTap!();
      }),
      child: widget.child,
    );
  }
}
