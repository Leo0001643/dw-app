import 'package:flutter/material.dart';
import 'package:leisure_games/app/intl/intr.dart';

class DsDewState {
  DsDewState() {
    ///Initialize variables
  }

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  ///默认tab在特码
  int tabIndex = 0;

  ScrollController? horizontalScrollController;


}
