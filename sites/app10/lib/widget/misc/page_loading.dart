import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
        valueColor: AlwaysStoppedAnimation(AppTheme.loadingColor),
      ),
    );
  }
}
