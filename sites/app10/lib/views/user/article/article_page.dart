import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../../../theme/theme_scaffold.dart';
import 'article_code.dart';
import 'article_controller.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticleController());
    final args = (Get.arguments as ArticleType);
    return ThemeScaffold(
      title: args.title,
      body: Column(
        children: [
          if (args.code == 'platform')
            SizedBox(
              height: 50.r,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: Obx(
                  () => Row(
                    children: controller.platformArticles
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(
                              right: 10.r,
                            ),
                            child: GestureDetector(
                              onTap: () => controller.id = e.id,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.r,
                                  horizontal: 15.r,
                                ),
                                decoration: BoxDecoration(
                                    gradient: controller.id == e.id
                                        ? AppTheme.primaryGradient
                                        : AppTheme.primaryGradient,
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                      color: controller.id == e.id
                                          ? AppTheme.onPrimaryGradient
                                          : AppTheme.onPrimaryGradient),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => HtmlRenderer(
                  data: controller.article.body ?? '-',
                  style: {
                    'p': Style(
                      color: Colors.white,
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
