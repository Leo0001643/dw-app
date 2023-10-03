import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'misc/dj_image.dart';

class LiveCasinoWidget extends StatelessWidget {
  final String image;
  final String titleImage;
  final String title;
  final String detail;
  final GestureTapCallback? callbackAction;
  LiveCasinoWidget({
    required this.image,
    required this.titleImage,
    required this.title,
    required this.detail,
    this.callbackAction,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
          DjImage.network(
            image,
            height: 100,
            width: 50,
          ),
          Positioned(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/header.png"),
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DjImage.network(titleImage),
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(detail,
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                GestureDetector(
                  onTap: callbackAction,
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('进入游戏'),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
