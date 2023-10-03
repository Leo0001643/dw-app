import 'dart:async';
import 'package:flutter/widgets.dart';

part 'count_down_controller.dart';

///
/// Simple countdown timer.
///
class Countdown extends StatefulWidget {
  /// Length of the timer
  final int minute;

  /// Build method for the timer
  final Widget Function(BuildContext, String, String) builder;
  final Widget Function(BuildContext) completeBuilder;

  /// Called when finished
  final Function? onFinished;

  /// Build interval
  final Duration interval;

  /// Controller
  final CountdownController? controller;

  ///
  /// Simple countdown timer
  ///
  const Countdown({
    Key? key,
    required this.minute,
    this.interval = const Duration(seconds: 1),
    this.onFinished,
    this.controller,
    required this.builder,
    required this.completeBuilder,
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

///
/// State of timer
///
class _CountdownState extends State<Countdown> {
  // Multiplier of secconds
  final int _secondsFactor = 60;

  // Timer
  Timer? _timer;

  /// Internal control to indicate if the onFinished method was executed
  bool _onFinishedExecuted = false;

  // Current seconds
  late int _currentMicroSeconds;
  late String _minuteString;
  late String _secondString;

  @override
  void initState() {
    _currentMicroSeconds = widget.minute * _secondsFactor;
    _minuteString = widget.minute.toString();
    _secondString = '00';

    widget.controller?.setOnStart(_startTimer);
    widget.controller?.setOnPause(_onTimerPaused);
    widget.controller?.setOnResume(_onTimerResumed);
    widget.controller?.setOnRestart(_onTimerRestart);
    widget.controller?.isCompleted = false;

    if (widget.controller == null || widget.controller!.autoStart == true) {
      _startTimer();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(Countdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.minute != widget.minute) {
      _currentMicroSeconds = widget.minute * _secondsFactor;
    }
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _onFinishedExecuted
        ? widget.completeBuilder(context)
        : widget.builder(
            context,
            _minuteString,
            _secondString,
          );
  }

  ///
  /// Then timer paused
  ///
  void _onTimerPaused() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }

  ///
  /// Then timer resumed
  ///
  void _onTimerResumed() {
    _startTimer();
  }

  ///
  /// Then timer restarted
  ///
  void _onTimerRestart() {
    widget.controller?.isCompleted = false;
    _onFinishedExecuted = false;

    setState(() {
      _currentMicroSeconds = widget.minute * _secondsFactor;
    });

    _startTimer();
  }

  ///
  /// Start timer
  ///
  void _startTimer() {
    if (_timer?.isActive == true) {
      _timer!.cancel();

      widget.controller?.isCompleted = true;
    }

    if (_currentMicroSeconds != 0) {
      _timer = Timer.periodic(
        widget.interval,
        (Timer timer) {
          if (_currentMicroSeconds <= 0) {
            timer.cancel();

            if (widget.onFinished != null) {
              widget.onFinished!();
              _onFinishedExecuted = true;
            }
            widget.controller?.isCompleted = true;
          } else {
            _onFinishedExecuted = false;
            setState(() {
              _currentMicroSeconds =
                  _currentMicroSeconds - widget.interval.inSeconds;

              if (_secondString == '00') {
                _secondString = '59';
                _minuteString = (int.parse(_minuteString) - 1).toString().length == 1 ? '0${(int.parse(_minuteString) - 1).toString()}': (int.parse(_minuteString) - 1).toString();
              } else {
                _secondString = (int.parse(_secondString) - 1).toString().length == 1 ? '0${(int.parse(_secondString) - 1).toString()}' : (int.parse(_secondString) - 1).toString();
              }
            });
          }
        },
      );
    } else if (!_onFinishedExecuted) {
      if (widget.onFinished != null) {
        widget.onFinished!();
        _onFinishedExecuted = true;
      }
      widget.controller?.isCompleted = true;
    }
  }
}
