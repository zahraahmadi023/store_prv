import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onchange;
  final int currentSlide;
  const ImageSlider(
      {super.key, required this.onchange, required this.currentSlide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: PageView(
                onPageChanged: onchange,
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                children: [
                  Image.asset(
                    "images/slider.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "images/image1.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "images/slider3.png",
                    fit: BoxFit.cover,
                  ),
                ],
              )),
        ),
        Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      width: currentSlide == index ? 15 : 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          color: currentSlide == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
