import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 查询组件
class SearchWidget extends StatefulWidget {
  final double? height; // 高度
  final double? width; // 宽度
  final String? hintText; // 输入提示
  final ValueChanged<String>? onEditingComplete; // 编辑完成的事件回调

  const SearchWidget(
      {Key? key,
      this.height,
      this.width,
      this.hintText,
      this.onEditingComplete})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  /// 清除查询关键词
  clearKeywords() {
    widget.onEditingComplete?.call(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var width = widget.width ?? constrains.maxWidth * 3 / 4; // 父级宽度
      var height = widget.width ?? widget.height ?? 30;
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(height)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: widget.hintText ?? "请输入搜索词",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.w,height: 18/14),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w).copyWith(top: 4.w),
              border: InputBorder.none,
            isCollapsed: true,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 18,
                ),
                onPressed: clearKeywords,
                splashColor: Theme.of(context).primaryColor,
              )),
          onEditingComplete: () {
            widget.onEditingComplete?.call(controller.text);
          },
          onChanged: (value) {
            widget.onEditingComplete?.call(controller.text);
          },
        ),
      );
    });
  }
}
