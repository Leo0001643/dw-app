import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widget/form/theme_radio_field.dart';
import '../controllers/activity_controller.dart';
import 'activity_text_input.dart';

class ApplyActivityDialog extends StatelessWidget {
  final ActivityInfo activityInfo;

  const ApplyActivityDialog({Key? key, required this.activityInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ActivityLogic());

    final controller = ActivityController.to;
    final form = controller.generateApplyForm(activityInfo);
    final logic = ActivityLogic.to;
    final state = logic.state;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10),
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
                        child: ActivityTextInput(
                      styleType: 2,
                      lableColor:
                          AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      label: e.extShowName,
                      name: e.extName.toString(),
                      hintText: e.extShowDesc,
                      hintColor:
                          AoneAppTheme.appTheme.activityDialogHintTextColor,
                      isRequired: e.isrequired == 1,
                    ));
                  }
                  if (e.extType == 'date') {
                    return _paddingWrapper(
                      child: Stack(
                        children: [
                          ActivityTextInput(
                            styleType: 2,
                            lableColor: AoneAppTheme
                                .appTheme.activityDialogSubTitleTextColor,
                            hintColor: AoneAppTheme
                                .appTheme.activityDialogHintTextColor,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            controller: controller.dateCtrl,
                            onClick: () {
                              Pickers.showDatePicker(
                                context,
                                pickerStyle:
                                    RaisedPickerStyle(color: AppTheme.primary),
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
                            name: e.extName.toString(),
                            hintText: e.extShowDesc,
                            isRequired: e.isrequired == 1,
                          ),
                          // Positioned(
                          //     top: 40.r,
                          //     right: 20.r,
                          //     child: Obx(() {
                          //       return Text(
                          //         state.startDate,
                          //         style: TextStyle(
                          //           fontSize: 12.sp,
                          //         ),
                          //       );
                          //     })),
                        ],
                      ),
                    );
                  }
                  if (e.extType == 'radio') {
                    // return ThemeRadioField(
                    //   initialValue: '1',
                    //   name: e.extName.toString(),
                    //   labelWidth: 60,
                    //   label: e.extShowName,
                    //   options: [
                    //     '1',
                    //     '2',
                    //   ]
                    //       .map(
                    //         (lang) => FormBuilderFieldOption(
                    //           value: lang,
                    //           child: Text(
                    //             lang == '1' ? '是' : '否',
                    //             style: TextStyle(
                    //                 color: AoneAppTheme.appTheme
                    //                     .activityDialogSubTitleTextColor),
                    //           ),
                    //         ),
                    //       )
                    //       .toList(growable: false),
                    // );

                    return _paddingWrapper(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Wrap(
                              children: [
                                if (e.isrequired == 1)
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 0, 0, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                Text(
                                  e.extShowName.toString(),
                                  style: TextStyle(
                                      color: AoneAppTheme.appTheme
                                          .activityDialogSubTitleTextColor),
                                ),
                                Text('(${e.extShowDesc.toString()})',
                                    style: TextStyle(
                                        color: AoneAppTheme.appTheme
                                            .activityDialogSubTitleTextColor))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.r),
                            child: ThemeRadioField(
                              initialValue: '1',
                              name: e.extName.toString(),
                              labelWidth: 60,
                              label: e.extShowName,
                              options: [
                                '1',
                                '2',
                              ]
                                  .map(
                                    (lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: Text(
                                        lang == '1' ? '是' : '否',
                                        style: TextStyle(
                                            color: AoneAppTheme.appTheme
                                                .activityDialogSubTitleTextColor),
                                      ),
                                    ),
                                  )
                                  .toList(growable: false),
                            ),
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
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AoneAppTheme.appTheme.activityDialogButtonBgColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: ElevatedButton(
                    onPressed: () {
                      final logic = ActivityLogic.to;
                      logic.applyActivity(activityInfo.id!, () => Get.back());
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
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _paddingWrapper({required Widget child, bool? isInput}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: child,
    );
  }
}
