import 'package:flutter/material.dart';

class ImageSliderDetail extends StatelessWidget {
  final Function(int) OnChang;
  final String image;
  const ImageSliderDetail(
      {super.key, required this.image, required this.OnChang});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: OnChang,
        itemBuilder: (context, index) {
          return Hero(tag: image, child: Image.asset(image));
        },
      ),
    );
  }
}
