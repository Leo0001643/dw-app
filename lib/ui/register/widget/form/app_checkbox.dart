import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  final bool? boolStu;
  final void Function(dynamic value) changed;
  const AppCheckBox({Key? key, this.boolStu, required this.changed})
      : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool _value = false;

  @override
  void initState() {
    setState(() {
      _value = widget.boolStu ?? false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.changed(_value);
      },
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _value
              ? Image.asset(
                  'assets/images/login/login_save_pas_checked.png',
                  width: 18,
                  height: 18,
                )
              : Image.asset(
                  'assets/images/login/login_save_pas_uncheck.png',
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
