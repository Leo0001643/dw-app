import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget? child;
  final double begin;
  final double end;
  final Curve curve;
  final int duration;

  const ScaleAnimation({
    Key? key,
    this.child,
    this.begin = 0.8,
    this.end = 1.0,
    this.curve = Curves.linear,
    this.duration = 1,
  }) : super(key: key);

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(
        begin: widget.begin,
        end: widget.end,
      ).animate(_animation),
      child: widget.child,
    );
  }
}

class SlideAnimation extends StatefulWidget {
  final Widget? child;
  final Offset begin;
  final Offset? end;
  final Curve curve;
  final int duration;

  const SlideAnimation({
    Key? key,
    this.child,
    this.begin = Offset.zero,
    this.end,
    this.curve = Curves.easeInOutQuad,
    this.duration = 1,
  }) : super(key: key);

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end ?? const Offset(0, 0.05),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class SwingAnimation extends StatefulWidget {
  final Widget? child;
  final double begin;
  final double? end;
  final Curve curve;
  final int duration;

  const SwingAnimation({
    Key? key,
    this.child,
    this.begin = 0.0,
    this.end,
    this.curve = Curves.easeInOutQuad,
    this.duration = 1,
  }) : super(key: key);

  @override
  _SwingAnimationState createState() => _SwingAnimationState();
}

class _SwingAnimationState extends State<SwingAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -0.05,
      end: 0.05,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
