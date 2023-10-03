import 'package:flutter/material.dart';
import 'package:gif/gif.dart';



class AoneGifView extends StatefulWidget {
  final String gitStr;
  final double? width;
  final double? height;

  const AoneGifView({Key? key,required this.gitStr, this.width, this.height}) : super(key: key);

  @override
  State<AoneGifView> createState() => _AoneGifViewrState();
}

class _AoneGifViewrState extends State<AoneGifView>
    with TickerProviderStateMixin {
  late final GifController? controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Gif(
        autostart: Autostart.loop,
        controller: controller,
        placeholder: (context) =>
            const Center(child: CircularProgressIndicator()),
        duration: const Duration(seconds: 2),
        image:  AssetImage(
            widget.gitStr,           
          ),
          width: widget.width ?? 40,
          height:widget.height ?? 40,
      ),
    );
  }
}
