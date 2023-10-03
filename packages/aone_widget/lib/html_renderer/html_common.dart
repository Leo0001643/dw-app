library html_render;

import 'package:html/dom.dart' show Element;
import 'package:flutter/material.dart' hide Element;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';

// 配置好table处理的HTML渲染插件
class HtmlCommon extends StatelessWidget {
  final String? data;
  final Map<bool Function(RenderContext), CustomRender>? extraCustomRenders;
  final void Function(String?, RenderContext, Map<String, String>, Element?)?
      onLinkTap;
  final void Function(String?, RenderContext, Map<String, String>, Element?)?
      onAnchorTap;
  final void Function(String?, RenderContext, Map<String, String>, Element?)?
      onImageTap;
  final void Function(Object, StackTrace?)? onImageError;
  final Map<String, Style>? style;
  final Style? globalStyle;
  final bool shrinkWrap;

  const HtmlCommon({
    Key? key,
    this.data,
    this.extraCustomRenders,
    this.onLinkTap,
    this.onAnchorTap,
    this.onImageTap,
    this.onImageError,
    this.style,
    this.shrinkWrap = true,
    this.globalStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      onLinkTap: onLinkTap,
      onAnchorTap: onAnchorTap,
      onImageTap: onImageTap,
      onImageError: onImageError,
      style: {
        ...?style,
      },
      customRenders: {
        tableMatcher(): CustomRender.widget(
          widget: (context, buildChildren) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: tableRender.call().widget!.call(context, buildChildren)),
        ),
        ...?extraCustomRenders,
      },
      shrinkWrap: shrinkWrap,
      data: data,
    );
  }
}
