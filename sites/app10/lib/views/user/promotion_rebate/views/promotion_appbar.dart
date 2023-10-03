import 'package:app10/theme/color_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackAppBar extends AppBar {
  String title1;
  BackAppBar(this.title1, {Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title1,
          style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
        ),
        centerTitle: true,
        leading: const Image(
          width: 25,
          height: 25,
          image: AssetImage(
            'assets/images/home/person_back.png',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ));
  }
}
