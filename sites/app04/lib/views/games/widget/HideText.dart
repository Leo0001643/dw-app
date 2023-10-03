import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///文字超出一定行，自动隐藏，并添加入"...查看更多详情"为它设置点击事件
class HideText extends StatefulWidget {
  HideText(
    this.text, {
    //正常字
    this.style, //正常字样式
    this.additionText, //附加字，如点击查看更多
    this.additionStyle, //附加字的样式
    this.maxLines = 1, //行数，不传 默认为3
    this.additionUrl, //点击附加字跳转URL
    this.additionParams, //点击附加字跳转时携带的参数
  })  : assert(text != null),
        assert(additionText != null);
  String text;
  TextStyle? style;
  String? additionText;
  TextStyle? additionStyle;
  int maxLines;
  String? additionUrl;
  Map<String, dynamic>? additionParams;
  @override
  _HideTextState createState() => _HideTextState();
}

class _HideTextState extends State<HideText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: _textPaint([TextSpan(text: widget.text, style: widget.style)])
              .didExceedMaxLines
          ? RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: widget.text.substring(0, _fontNum()),
                  style: widget.style,
                ),
                TextSpan(children: [
                  TextSpan(text: "...", style: widget.style),
                  TextSpan(
                      text: "${widget.additionText}",
                      style: widget.additionStyle)
                ], recognizer: TapGestureRecognizer()..onTap = () {})
              ]),
            )
          : Container(
              //未超出指定行数的话全部显示
              child: Text(
                widget.text ?? "",
                style: widget.style,
              ),
            ),
    );
  }

  TextPainter _textPaint(List<InlineSpan> children) {
    return TextPainter(
        maxLines: widget.maxLines,
        text: TextSpan(children: children),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: Get.width - 40); //若新功能宽度不一致，可尝试修改，
    //UIUtils.screenWidth(context)是自定义的获取屏幕宽度的方法
  }

  int _fontNum() {
    //计算最多可容纳正常字的数目，可优化
    int num = 0;
    int skip = 1;
    while (true) {
      bool isExceed = (widget.text.length ?? 0) < num + skip ||
          _textPaint([
            TextSpan(
                text: (widget.text.substring(0, num + skip) ?? "") + "...",
                style: widget.style),
            TextSpan(text: widget.additionText, style: widget.additionStyle)
          ]).didExceedMaxLines;
      if (!isExceed) {
        num = num + skip;
        skip *= 2;
        continue;
      }
      if (isExceed && skip == 1) {
        return num;
      }
      skip = skip ~/ 2;
    }
  }
}
