import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";

class IndicatorCommon extends StatelessWidget {
  const IndicatorCommon(
      {super.key,
      required this.controller,
      required this.current,
      required this.count});

  final CarouselController controller;
  final int current;
  final int count;

  @override
  Widget build(BuildContext context) {
    List<int> list = [for (var i = 0; i < count; i++) i];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateToPage(entry),
          child: Container(
            width: 5.0,
            height: 5.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(current == entry ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
