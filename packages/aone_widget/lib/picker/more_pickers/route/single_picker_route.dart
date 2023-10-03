import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../more_pickers/init_data.dart';
import '../../style/picker_style.dart';

typedef SingleCallback(var data, int position);

class SinglePickerRoute<T> extends PopupRoute<T> {
  SinglePickerRoute({
    required this.data,
    this.selectData,
    this.suffix,
    this.title,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    required this.theme,
    this.barrierLabel,
    required this.canSearch,
    required this.pickerStyle,
    RouteSettings? settings,
  }) : super(settings: settings);

  final dynamic selectData;
  final dynamic data;
  final SingleCallback? onChanged;
  final SingleCallback? onConfirm;
  final Function(bool isCancel)? onCancel;
  final ThemeData theme;
  final bool canSearch;
  final String? suffix;
  final String? title;
  final PickerStyle pickerStyle;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  bool didPop(T? result) {
    if (onCancel != null) {
      if (result == null) {
        onCancel!(false);
      } else if (!(result as bool)) {
        onCancel!(true);
      }
    }
    return super.didPop(result);
  }

  @override
  Color get barrierColor => Colors.black54;

  late AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    List mData = [];
    // 初始化数据
    if (data is PickerDataType) {
      mData = pickerData[data]!;
    } else if (data is List) {
      mData.addAll(data);
    }

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _PickerContentView(
        data: mData,
        selectData: selectData,
        pickerStyle: pickerStyle,
        route: this,
      ),
    );
    bottomSheet = Theme(data: theme, child: bottomSheet);

    return bottomSheet;
  }
}

class _PickerContentView extends StatefulWidget {
  _PickerContentView({
    Key? key,
    required this.data,
    this.selectData,
    required this.pickerStyle,
    required this.route,
  }) : super(key: key);

  final List data;
  final dynamic selectData;
  final SinglePickerRoute route;
  final PickerStyle pickerStyle;

  @override
  State<StatefulWidget> createState() =>
      _PickerState(this.data, this.selectData, this.pickerStyle);
}

class _PickerState extends State<_PickerContentView> {
  final PickerStyle _pickerStyle;
  // 选中数据
  var _selectData;
  // 选中数据下标
  int _selectPosition = 0;

  List _data = [];
  List allData = [];

  late FixedExtentScrollController scrollCtrl;

  // 单位widget Padding left
  late double _laberLeft;

  _PickerState(this._data, this._selectData, this._pickerStyle) {
    _init();
  }

  @override
  void dispose() {
    scrollCtrl.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
        animation: widget.route.animation!,
        builder: (BuildContext context, Widget? child) {
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _BottomPickerLayout(widget.route.animation!.value,
                  canSearch: widget.route.canSearch, pickerStyle: _pickerStyle),
              child: GestureDetector(
                child: Material(
                  color: Color.fromRGBO(235, 241, 250, 1),
                  child: _renderPickerView(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _init() {
    allData = List.from(_data);
    int pindex = 0;
    pindex = _data
        .indexWhere((element) => element.toString() == _selectData.toString());
    // 如果没有匹配到选择器对应数据，我们得修改选择器选中数据 ，不然confirm 返回的事设置的数据
    if (pindex < 0) {
      _selectData = _data[0];
      pindex = 0;
    }
    _selectPosition = pindex;

    scrollCtrl = new FixedExtentScrollController(initialItem: pindex);
    _laberLeft = _pickerLaberPadding(_data[pindex].toString());
  }

  void _setPicker(int index) {
    if (_data.length <= index) {
      return;
    }
    var selectedProvince = _data[index];

    // if (_selectData.toString() != selectedProvince.toString()) {
    // setState(() {
    // });
    _selectData = selectedProvince;
    _selectPosition = index;

    _notifyLocationChanged();
    // }
  }

  void _notifyLocationChanged() {
    if (widget.route.onChanged != null) {
      widget.route.onChanged!(_selectData, _selectPosition);
    }
  }

  double _pickerLaberPadding(String? text) {
    double left = 60;

    if (text != null) {
      left = left + text.length * 12;
    }
    return left;
  }

  double _pickerFontSize(String text) {
    if (text.length <= 6) {
      return 22.0;
    } else if (text.length < 9) {
      return 18.0;
    } else if (text.length < 13) {
      return 16.0;
    } else {
      return 14.0;
    }
  }

  final TextEditingController _textEditingController = TextEditingController();
  void _onChanged(String text) {
    if (text.length == 0 || text == null) {
      _data = allData;
      _initData();
      setState(() {});
      return;
    }

    _data = allData;
    _data = _data.where((e) => e.contains(text)).toList();
    _initData();
    setState(() {});
  }

  _initData() {
    int pindex = 0;
    pindex = _data
        .indexWhere((element) => element.toString() == _selectData.toString());
    if (pindex < 0) {
      _selectData = _data.length == 0 ? "" : _data[0];
      pindex = 0;
    }
    _selectPosition = 0;

    scrollCtrl.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.bounceIn);
    _laberLeft =
        _pickerLaberPadding(_data.length == 0 ? "" : _data[0].toString());
  }

  Widget _getSearchBar() {
    return Container(
      height: 40,
      width: 350,
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.blue, width: 1),
        color: Colors.white,
        borderRadius: new BorderRadius.circular((10.0)),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            // child:
            //    Padding(
            //        padding: EdgeInsets.only(
            //        bottom: MediaQuery.of(context).viewInsets.bottom
            //      ),
            child: TextField(
              cursorColor: Colors.green,
              autofocus: false,
              onChanged: _onChanged,
              controller: _textEditingController,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5, bottom: 10),
                border: InputBorder.none,
                hintText: '搜索',
              ),
            ),
            // ),
          ),
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget _renderPickerView() {
    Widget itemView = _renderItemView();

    if (!_pickerStyle.showTitleBar && _pickerStyle.menu == null) {
      return itemView;
    }
    List<Widget> viewList = <Widget>[];
    if (widget.route.title != null && widget.route.title != '') {
      _pickerStyle.title = Center(
          child: Text(widget.route.title!,
              style: TextStyle(
                  color: Color.fromRGBO(31, 31, 31, 1), fontSize: 17)));
      viewList.add(Container(
        padding: EdgeInsets.only(top: 6),
        color: const Color.fromRGBO(235, 241, 250, 1),
        height: 32,
        child: _pickerStyle.title,
      ));
    }
    if (widget.route.canSearch == true) {
      viewList.add(_getSearchBar());
    }

    viewList.add(itemView);
    if (_pickerStyle.showTitleBar) {
      viewList.add(_titleView());
    }
    if (_pickerStyle.menu != null) {
      viewList.add(_pickerStyle.menu!);
    }
    //
    // if (context.mediaQueryViewPadding.bottom > 0) {
    //   viewList.add(Container(height: context.mediaQueryViewPadding.bottom));
    // }

    return Column(children: viewList);
  }

  Widget _renderItemView() {
    // 选择器
    Widget cPicker = CupertinoPicker.builder(
      backgroundColor: const Color.fromRGBO(235, 241, 250, 1),
      scrollController: scrollCtrl,
      itemExtent: _pickerStyle.pickerItemHeight,
      selectionOverlay: _pickerStyle.itemOverlay,
      onSelectedItemChanged: (int index) {
        _setPicker(index);
        if (widget.route.suffix != null && widget.route.suffix != '') {
          // 如果设置了才计算 单位的paddingLeft
          double resuleLeft = _pickerLaberPadding(_data[index].toString());
          if (resuleLeft != _laberLeft) {
            setState(() {
              _laberLeft = resuleLeft;
            });
          }
        }
      },
      childCount: _data.length,
      itemBuilder: (_, index) {
        String text = _data[index].toString();
        return Align(
            alignment: Alignment.center,
            child: Text(text,
                style: TextStyle(
                    color: _pickerStyle.textColor,
                    fontSize: _pickerFontSize(text)),
                textAlign: TextAlign.start));
      },
    );

    Widget view;
    // 单位
    if (widget.route.suffix != null && widget.route.suffix != '') {
      Widget laberView = Center(
          child: AnimatedPadding(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.only(left: _laberLeft),
        child: Text(widget.route.suffix!,
            style: TextStyle(
                color: _pickerStyle.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ));

      view = Stack(children: [cPicker, laberView]);
    } else {
      view = cPicker;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: _pickerStyle.pickerHeight,
      color: Color.fromRGBO(235, 241, 250, 1),
      child: view,
    );
  }

  // 选择器上面的view
  Widget _titleView() {
    return Container(
      color: Color.fromRGBO(235, 241, 250, 1),
      margin: const EdgeInsets.only(bottom:30),
      height: _pickerStyle.pickerTitleHeight,
      // decoration: _pickerStyle.headDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// 取消按钮
          InkWell(
              onTap: () => Navigator.pop(context, false),
              child: _pickerStyle.cancelButton),

          SizedBox(
            width: 40,
          ),

          /// 确认按钮
          InkWell(
              onTap: () {
                if (widget.route.onConfirm != null) {
                  print('longer   _selectPosition >>> ${_selectPosition}');
                  widget.route.onConfirm!(_selectData, _selectPosition);
                }
                Navigator.pop(context, true);
              },
              child: _pickerStyle.commitButton)
        ],
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress,
      {required this.pickerStyle, required this.canSearch});
  final bool canSearch;
  final double progress;
  final PickerStyle pickerStyle;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = pickerStyle.pickerHeight;
    if (pickerStyle.showTitleBar) {
      maxHeight += pickerStyle.pickerTitleHeight;
    }
    if (this.canSearch == true) {
      maxHeight += 70;
    }
    if (pickerStyle.menu != null) {
      maxHeight += pickerStyle.menuHeight;
    }

    // if (pickerStyle.menu != null) {
    maxHeight += 70;
    // }

    return BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: maxHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
