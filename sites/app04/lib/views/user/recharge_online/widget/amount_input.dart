import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/color_schema.dart';
import '../../../../widget/misc/theme_card.dart';
import 'amount_chips.dart';

class AmountInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String?> onTextChange;
  final List<String> showMoney;
  final String? title;
  final String? hint;
  final TextStyle? textsStyle;
  final EdgeInsetsGeometry? textMargin;
  const AmountInput({
    Key? key,
    this.textEditingController,
    this.title,
    this.hint,
    this.textsStyle,
    this.textMargin,
    required this.onTextChange,
    required this.showMoney,

  }) : super(key: key);

  @override
  State<AmountInput> createState() => _AmountInputState();
}

class _AmountInputState extends State<AmountInput> {
  String amount = '';
  final TextEditingController _textEditingController = TextEditingController();

  void onValueChanged(String? val) {
    setState(() {
      amount = val ?? '';
      widget.onTextChange(val);
    });
  }

  String getAmount(String value) {
    if (double.tryParse(value) == null) {
      final _money = UserService.to.state.userInfo.money;
      return double.parse(_money!).round().toString();
    }
    return value;
  }

  void onChipsTap(String val) {
    final _amount = getAmount(val);
    widget.textEditingController?.text = _amount;
    _textEditingController.text = _amount;
    setState(() => amount = _amount);
    widget.onTextChange(_amount);
  }

  bool selected(String amount, String value) {
    if (amount == '') {
      return false;
    }
    var rounded = int.parse(amount).round().toString();
    if (widget.showMoney.contains(rounded)) {
      return amount == value;
    }
    return double.tryParse(value) == null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.textMargin??EdgeInsets.symmetric(horizontal: 12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title ?? '支付金额',
              style: TextStyle(fontSize: 14.sp, color: AppTheme.blackTextColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: widget.showMoney.isNotEmpty ? 12.r : 12.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.showMoney.isNotEmpty) ...[
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.r,
                      runSpacing: 10.r,
                      children: widget.showMoney
                          .map(
                            (e) => AmountChips(
                          isSelect: selected(amount, e),
                          amount: e,
                          onTap: () => onChipsTap(e),
                        ),
                      )
                          .toList(),
                    ),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.r),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all( Radius.circular(6.r)),
                              border: Border.all(
                                  color: AppTheme.undeer_line_color, width: 1)),
                          child: TextField(
                            controller: widget.textEditingController ??
                                _textEditingController,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
                            onChanged: onValueChanged,
                            style: TextStyle(
                              fontSize:
                                  (widget.showMoney.isNotEmpty ? 20 : 12).sp,
                              color: AppTheme.onBackground,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: false,
                                contentPadding: widget.showMoney.isNotEmpty
                                    ? EdgeInsets.symmetric(
                                        vertical: 5.r,
                                      )
                                    : null,
                                hintText: widget.hint ?? '请输入金额',
                                hintStyle: TextStyle(
                                    color: AppTheme.neutral2, fontSize: 14.sp)),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}
