import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_scaffold.dart';


class HelpDetailView extends StatelessWidget {
  final String title;
  final String content;

  const HelpDetailView({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      title: title,
      body: content == ''
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: HtmlRenderer(
                data: content,
              ),
            ),
    );
  }
}
