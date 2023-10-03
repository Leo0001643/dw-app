import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/color_schema.dart';
import 'amount_chips.dart';

class AmountInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String?> onTextChange;
  final List<String> showMoney;
  final String? title;
  final String? hint;
  final TextStyle? textsStyle;
  final EdgeInsetsGeometry? textMargin;
  final double? inputFieldHeight;
  final double? titleSpace;
  const AmountInput(
      {Key? key,
      this.textEditingController,
      this.title,
      this.hint,
      this.textsStyle,
      this.textMargin,
      required this.onTextChange,
      required this.showMoney,
      this.inputFieldHeight,
      this.titleSpace})
      : super(key: key);

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
      final money = UserService.to.state.userInfo.money;
      return double.parse(money!).round().toString();
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
  void initState() {
    super.initState();

    TextEditingController textCtrl =
        widget.textEditingController ?? _textEditingController;

    textCtrl.addListener(() {
      var text = textCtrl.text;
      onValueChanged(text); //便于从外部清空数据
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.textMargin ?? EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widget.titleSpace ?? 15),
              child: Text(
                widget.title ?? '支付金额',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTheme.blackTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: widget.showMoney.isNotEmpty ? 12.r : 8.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: AppTheme.undeer_line_color))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Text(
                            '¥  ',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: AppTheme.rechargeHighLightTextColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: widget.inputFieldHeight ?? 44.r,
                            child: TextField(
                              controller: widget.textEditingController ??
                                  _textEditingController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              cursorColor: AppTheme.rechargeHighLightTextColor,
                              // onChanged: onValueChanged,
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp("[0-9]"),
                                    allow: true)
                              ],
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  color: AppTheme.rechargeHighLightTextColor),
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
                                      color:
                                          AppTheme.rechargeHighLightTextColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Text('元',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppTheme.rechargeHighLightTextColor,
                                  fontWeight: FontWeight.normal)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.r,
                  ),
                  if (widget.showMoney.isNotEmpty) ...[
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 20.r,
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
                ],
              ),
            ),
          ],
        ));
  }
}
