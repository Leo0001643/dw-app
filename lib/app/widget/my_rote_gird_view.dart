import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/colorx.dart';

class MyRoteGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyRoteGridView> {
  int selectedTileIndex = -1;

  List<String> titles = ['线路1', '线路2', '线路3', '线路4', '线路5', '线路6'];
  List<String> contents = [
    '285ms',
    '255ms',
    '233ms',
    '441ms',
    '441ms',
    '441ms'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 168 / 40,
      ),
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTileIndex = index;
            });
          },
          child:
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedTileIndex == index ? ColorX.cardBg9() : ColorX.cardBg10(),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.0, // 设置高度为6像素
                  width: 6.0, // 设置宽度为6像素
                  decoration: const BoxDecoration(
                    color: ColorX.color_60c549,
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(child:   Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: ColorX.appTextBg(),
                  ),
                ),),

                Text(
                  contents[index],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: ColorX.appTextBg(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
