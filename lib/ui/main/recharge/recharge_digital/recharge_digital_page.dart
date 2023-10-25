import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'recharge_digital_logic.dart';

//usdt钱包充值
class RechargeDigitalPage extends StatefulWidget {
  const RechargeDigitalPage({Key? key}) : super(key: key);

  @override
  State<RechargeDigitalPage> createState() => _RechargeDigitalPageState();
}

class _RechargeDigitalPageState extends State<RechargeDigitalPage> with SingleTickerProviderStateMixin {
  final logic = Get.find<RechargeDigitalLogic>();
  final state = Get.find<RechargeDigitalLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      state.selectOnline.value = _tabController.index == 0;
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RechargeDigitalLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.color_f7f8fb,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageX.recharge_bg),fit: BoxFit.fill),
            ),
            height: 226.h,
          ),
          Column(
            children: [
              WidgetUtils().buildRoomBar(state.title,bgColor: Colors.transparent,msg: true,onTap: (){
                DialogUtils().showSelectPaywayBtmDialog(context).then((value) {
                  if(unEmpty(value)){
                    showToast("选择了${value}");
                    if(value == 6){
                    }else {///打开其他类型的选项
                      Get.offAndToNamed(Routes.recharge_category,arguments: true);
                    }
                  }
                });
              }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                child: GFTabBar(
                  length: 3,
                  controller: _tabController,
                  tabBarHeight: 35.h,
                  tabBarColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(top: 31.h,left: 30.w,right: 30.w,bottom: 1.h),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.color_091722,
                  ),
                  labelColor: ColorX.color_091722,
                  unselectedLabelColor: ColorX.color_58698d,
                  width: 335.w,
                  tabs: [
                    Text("线上(自动到账)",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    Text("线下(人工存款)",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorX.color_091722,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                              shape: BoxShape.circle,
                            ),
                            width: 8.r,height: 8.r,
                          ),
                          SizedBox(width: 13.w,),
                          Text("第一步,选择支付协议",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 18.w,),
                          Container(width: 1.w,height: 55.h,color: Colors.black54,),
                          SizedBox(width: 13.w,),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(() {
                                var list = List<Widget>.empty(growable: true);
                                state.agreeList.forEach((element) {
                                  list.add(InkWell(
                                    onTap: ()=> state.selectAgree.value = state.agreeList.indexOf(element),
                                    child: buildAgreementItem(element, state.selectAgree.value == state.agreeList.indexOf(element)),
                                  ));
                                  list.add(SizedBox(width: 10.r,));
                                });
                                return Row(children: list,);
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorX.color_5b6d7b,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                              shape: BoxShape.circle,
                            ),
                            width: 8.r,height: 8.r,
                          ),
                          SizedBox(width: 13.w,),
                          Text("第二步,查看收款信息,进行转账充值",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SizedBox(width: 18.w,),
                          Obx(() {
                            return Visibility(
                              visible: !state.selectOnline.value,
                              child: Container(width: 1.w,height: 220.h,color: Colors.black12,),
                            );
                          }),
                          SizedBox(width: 13.w,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("充值账户",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                                  SizedBox(height: 10.h,),
                                  Container(
                                    decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
                                    width: 300.w,height: 45.h,
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("username",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                                        InkWell(
                                          onTap: ()=> WidgetUtils().clickCopy("username"),
                                          child: Image.asset(ImageX.icon_copy,color: ColorX.color_58698d,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Row(
                                    children: [
                                      QrImageView(
                                        data: "1234567890",
                                        size: 112.r,
                                      ),
                                      SizedBox(width: 17.w,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("收款账户",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722),),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorX.color_f7f8fb,
                                                borderRadius: BorderRadius.circular(8.r),
                                              ),
                                              padding: EdgeInsets.all(5.r),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("TY7ZSy8Q3pXibU2m9FoAvAK9g36THYt8cL",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                                                  InkWell(
                                                    onTap: ()=> WidgetUtils().clickCopy("TY7ZSy8Q3pXibU2m9FoAvAK9g36THYt8cL"),
                                                    child: Image.asset(ImageX.icon_copy,color: ColorX.color_58698d,),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8.w,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w,),
                        ],
                      ),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: SizedBox(height: 15.h,),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorX.color_5b6d7b,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                                  shape: BoxShape.circle,
                                ),
                                width: 8.r,height: 8.r,
                              ),
                              SizedBox(width: 13.w,),
                              Text("第三步,完成转账后填写入款信息",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: SizedBox(height: 10.h,),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: Row(
                            children: [
                              SizedBox(width: 30.w,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("充值账户",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                                    SizedBox(height: 10.h,),
                                    Container(
                                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
                                      width: 300.w,height: 45.h,
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("username",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                                          InkWell(
                                            onTap: ()=> WidgetUtils().clickCopy("username"),
                                            child: Image.asset(ImageX.icon_copy,color: ColorX.color_58698d,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Text("汇款姓名",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                                    SizedBox(height: 10.h,),
                                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.color_091722, "请输入汇款人姓名",backgroundColor: ColorX.color_f7f8fb),
                                    SizedBox(height: 10.h,),
                                    Text("汇款金额",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                                    SizedBox(height: 10.h,),
                                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.color_091722, "请输入汇款金额",backgroundColor: ColorX.color_f7f8fb,
                                        inputType: TextInputType.number),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 20.h,),
                      Obx(() {
                        var tab = state.selectOnline.value ? "返回首页" : "提交";
                        return WidgetUtils().buildElevatedButton(tab, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                          if(state.selectOnline.value){
                            eventBus.fire(ChangeMainPageEvent(0));
                            Get.back();
                          }else {
                            Get.offAndToNamed(Routes.recharge_result);
                          }
                        });
                      }),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils().buildElevatedButton("币币兑换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                            Get.toNamed(Routes.coin_exchange);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton("充值记录", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                            Get.toNamed(Routes.recharge_record);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton("额度转换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                            Get.toNamed(Routes.quota_conversion);
                          }),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text.rich(TextSpan(
                            children: [
                              TextSpan(text: "支付说明:\n1.",
                                style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,height: 1.8),),
                              TextSpan(text: "充值完毕,系统会在2分钟内自动存入USDT钱包,如果您想使用CNY钱包,请到「币币兑换」页面兑换\n",
                                style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b,height: 1.8),),
                              TextSpan(text: "2.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定",
                                style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,height: 1.8),),
                            ]
                        )),
                      ),
                      SizedBox(height: 50.h,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget buildAgreementItem(String name,bool select) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: select ? const LinearGradient(colors: [ColorX.color_ff5164,ColorX.color_fd273e],begin: Alignment.topLeft,end:
            Alignment.bottomRight) : const LinearGradient(colors: [Colors.white,Colors.white]),
          ),
          width: 150.w,height: 50.h,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          alignment: Alignment.center,
          child: Text(name,style: TextStyle(fontSize: 16.sp,color: select?Colors.white:ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
      ],
    );
  }


}