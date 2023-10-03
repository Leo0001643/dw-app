import 'package:dokit/util/screen_util.dart';
import 'package:flutter/material.dart';

import '../theme/color_schema.dart';

class NoData extends StatelessWidget {
  final String title;

  const NoData({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/common/${AppTheme.siteTag}_no_data_img.png',
            width: 200,
            height: 179,
          ),
          Text(title),
        ],
      ),
    );
  }
}
