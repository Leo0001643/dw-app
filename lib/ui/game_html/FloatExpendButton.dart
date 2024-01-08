import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/**
 * created by:number9
 * time:2021.7.02
 */
class FloatExpendButton extends StatefulWidget {
  //按钮图标
  List<Icon> iconList;

  //按钮高度
  double? fabHeight;

  //主菜单按钮图标大小
  double? iconsize;

  //选项卡按钮间隔
  double? tabspace;

  //选项卡按钮颜色
  Color? tabcolor;

  //主菜单卡收起后颜色
  Color? MainTabBeginColor;

  //主菜单卡展开后颜色
  Color? MainTabAfterColor;

  //主菜单卡变化图标（动画图标）
  AnimatedIconData? MainAnimatedIcon;

  //选项卡类型即展开方向
  ButtonType type;

  //按钮的点击事件
  final Function(int index) callback;

  FloatExpendButton(this.iconList,
      {required this.callback,
      this.fabHeight = 40,
      this.tabspace = 10,
      this.tabcolor = Colors.blue,
      this.MainTabBeginColor = Colors.red,
      this.MainTabAfterColor = Colors.grey,
      this.MainAnimatedIcon = AnimatedIcons.menu_close,
      this.iconsize = 15,
      this.type = ButtonType.Left});

  @override
  _FloatExpendState createState() => _FloatExpendState();
}

//旋转变换按钮 向上弹出的效果 State实现
class _FloatExpendState extends State<FloatExpendButton>
    with SingleTickerProviderStateMixin {
  //记录是否打开
  bool isOpened = false;

  //动画控制器
  late AnimationController _animationController;

  //颜色变化取值
  late Animation<Color?> _animateColor;

  //图标变化取值
  late Animation<double> _animateIcon;

  //按钮的位置动画
  late Animation<double> _fabtween;

  //动画执行速率
  Curve _curve = Curves.easeOut;

  @override
  initState() {
    super.initState();
    //初始化动画控制器
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    //添加动画监听
    _animationController.addListener(() {
      setState(() {});
    });
    //Tween结合_animationController，使300毫秒内执行一个从0.0到0.1的变换过程
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    //结合_animationController 实现一个从Colors.blue到Colors.deepPurple的动画过渡
    _animateColor = ColorTween(
      begin: widget.MainTabBeginColor,
      end: widget.MainTabAfterColor,
    ).animate(CurvedAnimation(parent: _animationController, curve: _curve));

    _fabtween = Tween<double>(
      begin: 0,
      end: _getfabtweenAfter(),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
  }

  //根据类型获取变化结束值
  double _getfabtweenAfter() {
    if (widget.type == ButtonType.Right || widget.type == ButtonType.Bottom) {
      return widget.fabHeight! + widget.tabspace!;
    } else {
      return -(widget.fabHeight! + widget.tabspace!);
    }
  }

  //根据类型获取X轴移动数值
  double _getfabtranslateX(int i) {
    if (widget.type == ButtonType.Left || widget.type == ButtonType.Right) {
      return _fabtween.value * (i + 1);
    } else {
      return 0;
    }
  }

  //根据类型获取Y轴移动数值
  double _getfabtranslateY(int i) {
    if (widget.type == ButtonType.Top || widget.type == ButtonType.Bottom) {
      return _fabtween.value * (i + 1);
    } else {
      return 0;
    }
  }

  //根据类型获取主菜单位置
  AlignmentGeometry _getAligment() {
    if (widget.type == ButtonType.Top) {
      return Alignment.bottomCenter;
    } else if (widget.type == ButtonType.Left) {
      return Alignment.centerRight;
    } else if (widget.type == ButtonType.Bottom) {
      return Alignment.topCenter;
    } else {
      return Alignment.centerLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    //构建子菜单
    List<Widget> itemList = [];

    for (int i = 0; i < widget.iconList.length; i++) {
      //通过Transform来促成FloatingActionButton的平移
      itemList.add(
        Transform(
          transform: Matrix4.translationValues(
              _getfabtranslateX(i), _getfabtranslateY(i), 0.0),
          child: Container(
            width: widget.fabHeight,
            height: widget.fabHeight,
            //margin: EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              heroTag: "$i",
              elevation: 0.5,
              backgroundColor: widget.tabcolor,
              onPressed: () {
                // //点击菜单子选项要求菜单弹缩回去
                //if(isOpened){
                floatClick();
                if (widget.callback != null) {
                  widget.callback(i);
                }
                //}
              },
              child: Icon(
                widget.iconList[i].icon,
                key: widget.iconList[i].key,
                size: widget.iconList[i].size,
                semanticLabel: widget.iconList[i].semanticLabel,
                textDirection: widget.iconList[i].textDirection,
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      alignment: _getAligment(),
      children: [
        widget.type == ButtonType.Left || widget.type == ButtonType.Right
            ? SizedBox(
                width: (widget.fabHeight! + widget.tabspace!) *
                        widget.iconList.length +
                    widget.fabHeight!)
            : SizedBox(
                height: (widget.fabHeight! + widget.tabspace!) *
                        widget.iconList.length +
                    widget.fabHeight!),
      ] //根据横纵情况拓展点击区域
        ..addAll(itemList)
        ..add(Positioned(
          child: floatButton(),
        )),
    );
  }

  //构建固定旋转菜单按钮
  Widget floatButton() {
    return Container(
      width: widget.fabHeight,
      height: widget.fabHeight,
      child: FloatingActionButton(
        //通过_animateColor实现背景颜色的过渡
        backgroundColor: _animateColor.value, // _animateColor.value
        onPressed: floatClick,
        elevation: 0.5,
        //通过AnimatedIcon实现标签的过渡
        child: AnimatedIcon(
          icon: widget.MainAnimatedIcon!,
          size: widget.iconsize,
          progress: _animateIcon,
        ),
      ),
    );
  }

  //FloatingActionButton的点击事件，用来控制按钮的动画变换
  floatClick() {
    if (!isOpened) {
      _animationController.forward(); //展开动画
    } else {
      _animationController.reverse(); //收回动画
    }
    isOpened = !isOpened;
  }

  //页面销毁时，销毁动画控制器
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

enum ButtonType { Left, Right, Top, Bottom }
