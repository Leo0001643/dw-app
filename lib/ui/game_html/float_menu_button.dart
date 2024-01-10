import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'FloatExpendButton.dart';


class FloatMenuButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatMenuButtonState();
  }
}

class _FloatMenuButtonState extends State<FloatMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatExpendButton(
                  fabHeight: 50,
                  //菜单图标组
                  [
                    Icon(
                      Icons.add,
                      size: 10,
                    ),
                    Icon(Icons.share, size: 15)
                  ],
                  //点击事件回调
                  callback: (int index) {
                    print("点击");
                    print(index);
                  },
                  tabcolor: Colors.yellow,
                  tabspace: 5,
                  type: ButtonType.Top,
                ),
                SizedBox(
                  height: 20,
                ),
                FloatExpendButton(
                  //菜单图标组
                  [
                    Icon(
                      Icons.add,
                      size: 15,
                    ),
                    Icon(Icons.share, size: 15)
                  ],
                  //点击事件回调
                  callback: (int index) {
                    print("点击");
                    print(index);
                  },
                  tabcolor: Colors.red,
                  fabHeight: 50,
                  tabspace: 10,
                  type: ButtonType.Left,
                ),
                SizedBox(
                  height: 20,
                ),
                FloatExpendButton(
                  //菜单图标组
                  [
                    Icon(
                      Icons.add,
                      size: 15,
                    ),
                    Icon(Icons.share, size: 20)
                  ],
                  //点击事件回调
                  callback: (int index) {
                    print("点击");
                    print(index);
                  },
                  tabcolor: Colors.green,
                  fabHeight: 60,
                  tabspace: 5,
                  type: ButtonType.Right,
                ),
                SizedBox(
                  height: 20,
                ),
                FloatExpendButton(
                  //菜单图标组
                  [
                    Icon(
                      Icons.add,
                      size: 15,
                    ),
                    Icon(Icons.share, size: 15)
                  ],
                  //点击事件回调
                  callback: (int index) {
                    print("点击");
                    print(index);
                  },
                  fabHeight: 30,
                  tabspace: 15,
                  type: ButtonType.Bottom,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

