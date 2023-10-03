import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/widgets/recharge_scaffold.dart';

class HelpDetailView extends StatelessWidget {
  final String title;
  final String content;

  const HelpDetailView({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RechargeTheme _theme = RechargeTheme();
    return RechargeScaffold(
      backgroundColor: _theme.backgroundColor,
      title: title,
      actions: [
        if (_theme.jiiaochengPageKefuImage != null)
          IconButton(
              onPressed: () {
                if (_theme.onCustomerServiceTap != null) {
                  _theme.onCustomerServiceTap!();
                }
              },
              icon: Image.asset(
                _theme.jiiaochengPageKefuImage!,
                width: 20,
                height: 20,
              ))
      ],
      body: content == ''
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: HtmlRenderer(
                data: content,
              ),
            ),
    );
  }
}
