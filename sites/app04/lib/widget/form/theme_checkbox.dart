import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ThemeCheckbox extends StatelessWidget {
  final String name;
  final String title;

  const ThemeCheckbox({
    Key? key,
    required this.name,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilderCheckbox(
        title: Text(title),
        name: name,
      ),
    );
  }
}
