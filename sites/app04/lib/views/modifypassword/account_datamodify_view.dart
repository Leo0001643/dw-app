import 'package:aone_common/utils/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../widget/form/theme_text_input.dart';
import '../../theme/theme_scaffold.dart';
import 'controllers/account_datamodify_controller.dart';

// todo: 需要兼容修改其他的联系方式
class AccountDataModifyView extends GetView<AccountDataModifyController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountDataModifyController>(
      builder: (_) {
        return ThemeScaffold(
          title: _.title,
          body: Column(
            children: <Widget>[
              _buildContentView(_),
              _footButton(),
            ],
          ),
        );
      },
    );
  }

  _buildContentView(AccountDataModifyController _) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
        color: stringToColor('f2f5f8'),
        // color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Text(_.label,
              style: TextStyle(
                  color: stringToColor('0b213b', 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            width: 10,
          ),
          _.keyword == "safeQuestion"
              ? Expanded(
                  child: Container(
                    color: Colors.white,
                    child: FormBuilderField(
                      builder: (FormFieldState<dynamic> field) {
                        return Obx(() {
                          return DropdownButtonFormField2<String>(
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                fillColor: Color(0xFFf2f5f8),
                                filled: true,
                                hintText: controller.regWenValue),
                            isExpanded: true,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            items: controller.state.questionList
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: '${e}',
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) => controller.onSelectClose(val!),
                          );
                        });
                      },
                      name: 'bank',
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: controller.inputController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, bottom: 7, right: 10),
                        hintText: _.hintText,
                        border: InputBorder.none,
                        fillColor: stringToColor('f2f5f8'),
                        filled: true,
                        enabled: true),
                  ),
                )),
        ],
      ),
    );
  }

  _footButton() {
    return GestureDetector(
      onTap: () async {
        await controller.postData();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 244,
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [stringToColor('429ffe'), stringToColor('2f72f4')])),
        child: const Text(
          '确认修改',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
