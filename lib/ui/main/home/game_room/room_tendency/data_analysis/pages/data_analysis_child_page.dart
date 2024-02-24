import 'package:flutter/material.dart';


///数据分析
class DataAnalysisChildPage extends StatefulWidget {
  const DataAnalysisChildPage({super.key}) ;

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
          width: 200,
        height: 200,
        color: Colors.red,
        child: Text("13123123")),
      ],
    );
  }
}

