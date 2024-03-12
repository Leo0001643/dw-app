import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class SelectOptionBtmGirdDialog extends StatefulWidget {
  String title;
  List data;
  int defIndex;

  SelectOptionBtmGirdDialog(this.title, this.data,this.defIndex, {super.key});

  @override
  State<StatefulWidget> createState() => StateSelectOptionBtmDialog();
}

class StateSelectOptionBtmDialog extends State<SelectOptionBtmGirdDialog> {
  var data = List.empty(growable: true);

  var currentIndex = 0.obs;

  @override
  void initState() {
    data.addAll(widget.data);
    currentIndex.value = widget.defIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        // color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          buildHeader(),
          SizedBox(height: 10.h,),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 39.0,
              mainAxisSpacing: 18.0,
              childAspectRatio: 70 / 30,
            ),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return InkWell(
                  onTap: () {
                    // currentIndex.value = data.indexOf(data.elementAt(index));
                    Navigator.pop(context,data.elementAt(index));
                  },
                  child: buildOptionItem2(data.elementAt(index),
                      currentIndex.value == data.indexOf(data.elementAt(index))),
                );
              });
            },
          ),
          SizedBox(height: 30.h,),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              child: WidgetUtils().buildElevatedButton(
                  Intr().cancel, double.infinity, 50.h,
                  textSize: 12.sp, bg: ColorX.color_fc243b, onPressed: () {
                Navigator.of(context).pop(null);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorX.text0917(),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOptionItem(dynamic option, bool select) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Image.asset(select ? ImageX.icon_select : ImageX.icon_unselect),
              SizedBox(
                width: 5.w,
              ),
              Text(
                option.toString(),
                style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Divider(
            color: ColorX.color_10_949,
            height: 1.h,
          ),
        ],
      ),
    );
  }

  Widget buildOptionItem2(dynamic option, bool select) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(
          color: select ? ColorX.color_fc243b : ColorX.text0917(),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        option.toString(),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: select ? ColorX.color_fc243b : ColorX.text0917(),
        ),
      ),
    );
  }
}

class MyRoteGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyRoteGridView> {
  int selectedTileIndex = -1;

  List<String> titles = ['线路1', '线路2', '线路3', '线路4', '线路5', '线路6'];
  List<String> contents = [
    '285ms',
    '255ms',
    '233ms',
    '441ms',
    '441ms',
    '441ms'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 168 / 40,
      ),
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTileIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedTileIndex == index
                    ? ColorX.cardBg9()
                    : ColorX.cardBg10(),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.0, // 设置高度为6像素
                  width: 6.0, // 设置宽度为6像素
                  decoration: const BoxDecoration(
                    color: ColorX.color_60c549,
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: ColorX.appTextBg(),
                    ),
                  ),
                ),
                Text(
                  contents[index],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: ColorX.appTextBg(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
