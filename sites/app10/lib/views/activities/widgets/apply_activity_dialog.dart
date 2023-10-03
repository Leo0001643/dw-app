import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/form/theme_text_input.dart';
import '../../../widget/misc/background_wrapper.dart';
import '../controllers/activity_controller.dart';

class ApplyActivityDialog extends StatelessWidget {
  final ActivityInfo activityInfo;

  const ApplyActivityDialog({Key? key, required this.activityInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ActivityController.to;
    final form = controller.generateApplyForm(activityInfo);
    final logic = ActivityLogic.to;
    final state = logic.state;
    return BackgroundWrapper(
      child: ThemeScaffold(
        title: activityInfo.title ?? '',
        backgroundColor: AppTheme.onPrimary,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: FormBuilder(
              key: logic.state.applyFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...?form.extArgs?.map(
                    (e) {
                      if (e.extType == 'string' || e.extType == 'numeric') {
                        return _paddingWrapper(
                            child: ThemeTextInput(
                          padding: EdgeInsets.only(
                              right: 15.r, left: e.isrequired == 1 ? 6.r : 0),
                          label: e.extShowName,
                          name: e.extName.toString(),
                          hintText: e.extShowDesc,
                          isRequired: e.isrequired == 1,
                        ));
                      }
                      if (e.extType == 'date') {
                        return _paddingWrapper(
                          child: Stack(
                            children: [
                              ThemeTextInput(
                                padding: EdgeInsets.only(right: 15.r),
                                controller: controller.dateCtrl,
                                onClick: () {
                                  Pickers.showDatePicker(
                                    context,
                                    pickerStyle: RaisedPickerStyle(
                                        color: AppTheme.primary),
                                    title: "请选择截止日期",
                                    onConfirm: (p) {
                                      print(111111);
                                      int year = p.getSingle(DateType.Year);
                                      int month = p.getSingle(DateType.Month);
                                      int date = p.getSingle(DateType.Day);
                                      String startDate =
                                          "${year}${month < 10 ? "-0$month" : "-$month"}${date < 10 ? "-0$date" : "-$date"}";
                                      print(startDate);
                                      state.startDate = startDate;
                                      controller.dateCtrl.text = startDate;
                                    },
                                  );
                                },
                                isReadOnly: true,
                                label: e.extShowName,
                                name: state.startDate ?? e.extName.toString(),
                                hintText: e.extShowDesc,
                                isRequired: e.isrequired == 1,
                              ),
                              Positioned(
                                  top: 40.r,
                                  right: 20.r,
                                  child: Obx(() {
                                    return Text(
                                      state.startDate,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    );
                                  })),
                            ],
                          ),
                        );
                      }
                      if (e.extType == 'radio') {
                        return _paddingWrapper(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 18.r),
                                  if (e.isrequired == 1)
                                    const Text(
                                      '*',
                                      style: TextStyle(
                                          color: Color.fromRGBO(255, 0, 0, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  Text(e.extShowName.toString()),
                                  Text('(${e.extShowDesc.toString()})')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5.r,
                                  ),
                                  Obx(() => Radio(
                                        // 按钮的值
                                        value: 1,
                                        // 改变事件
                                        onChanged: (value) {
                                          debugPrint('6666666666 $value ');
                                          state.yesOrNo = 1;
                                        },
                                        // 按钮组的值
                                        groupValue: state.yesOrNo,
                                      )),
                                  Text('是'.tr),
                                  SizedBox(
                                    width: 20.r,
                                  ),
                                  Obx(
                                    () => Radio(
                                      value: 2,
                                      onChanged: (value) {
                                        debugPrint('99999999 $value ');
                                        state.yesOrNo = 2;
                                      },
                                      groupValue: state.yesOrNo,
                                    ),
                                  ),
                                  Text('否'.tr),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      return SizedBox(
                        width: 0,
                      );
                    },
                  ).toList(),
                  _paddingWrapper(
                    child: Container(
                      height: 40,
                      width: context.width * 0.88,
                      decoration: BoxDecoration(
                          color: AppTheme.primaryButtonBg,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: ElevatedButton(
                        onPressed: () {
                          final logic = ActivityLogic.to;
                          logic.applyActivityNew(
                              activityInfo.id!, () => Get.back());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r)),
                        ),
                        child: Text('submit'.tr),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _paddingWrapper({required Widget child, bool? isInput}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: child,
    );
  }
}
