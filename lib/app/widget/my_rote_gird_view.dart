
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/oss_utils.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';

typedef void FunctionApiCallback(BaseWsApiEntity data);

class MyRoteGridView extends StatefulWidget {
  final FunctionApiCallback callback;
  const MyRoteGridView(this.callback, {super.key});

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyRoteGridView> {
  var selectedTileIndex = (-1).obs;
  var list = RxList<BaseWsApiEntity>.empty(growable: true);

  @override
  void initState() {
    queryRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 168 / 40,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          var color = ColorX.color_60c549;
          if(item.delayTime.em() != 0){
            if(item.delayTime.em() < 200){
              color = ColorX.color_60c549;
            }else if(item.delayTime.em() < 600){
              color = ColorX.color_ff9e52;
            }else if(item.delayTime.em() < 900){
              color = ColorX.color_d53849;
            }else{
              color = ColorX.color_b5b5b5;
            }
          }
          return GestureDetector(
            onTap: () {
              selectedTileIndex.value = index;
              widget.callback(item);
            },
            child: Obx(() {
              return Container(
                padding: EdgeInsets.all(8.r),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedTileIndex.value == index ? ColorX.cardBg9() : ColorX.cardBg10(),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 6.r, // 设置高度为6像素
                      width: 6.r, // 设置宽度为6像素
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle, // 设置形状为圆形
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        Intr().xianlu_(["${index + 1}"]),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorX.appTextBg(),
                        ),
                      ),
                    ),
                    item.delayTime.em() == 0 ?
                    const CupertinoActivityIndicator(color: ColorX.color_2c2c2c,) :
                    Text(
                      '${item.delayTime.em()}ms',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorX.appTextBg(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      );
    });
  }

  ///请求云存储里的路线
  void queryRoutes() async {
    var value = await HttpService.getApiLines();
   if(unEmpty(value)){
     ///用于判断是否需要更新缓存使用
     value!.updateTime = DateTime.now().millisecondsSinceEpoch;
     AppData.setOssApi(value);
     list.assignAll(value.toApiList());
     ///设置默认选择位置
     list.forEach((v){
       if(v.baseApi == AppData.baseUrl()){
         selectedTileIndex.value = list.indexOf(v);
       }
     });
     list.refresh();///显示路线
     for(var i=0;i< list.em();i++){
       list[i].delayTime = await DataUtils.testApiDelay(list[i].baseApi.em());
     }
     list.refresh();
   }
  }


}
