import 'package:flutter/material.dart';

class GenPageLoading extends StatelessWidget {
  const GenPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
          // valueColor: AlwaysStoppedAnimation(AppTheme.loadingColor),
          ),
    );
  }
}
