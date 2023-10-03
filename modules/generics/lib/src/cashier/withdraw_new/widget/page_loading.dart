import 'package:flutter/material.dart';


class PageLoading extends StatelessWidget {
  const PageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
        valueColor: AlwaysStoppedAnimation(Color.fromRGBO(187, 164, 130, 1)),
      ),
    );
  }
}
