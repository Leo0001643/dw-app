import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';


///数据分析
class DataAnalysisChildPage extends StatefulWidget {
  const DataAnalysisChildPage({Key? key}) : super(key: key);

  @override
  State<DataAnalysisChildPage> createState() => _DataAnalysisChildPageState();
}

class _DataAnalysisChildPageState extends State<DataAnalysisChildPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
        color: Colors.red,
        child: Text("13123123")),
      ],
    );
  }
}

