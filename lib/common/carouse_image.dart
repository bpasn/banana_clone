import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:banana_clone/common/Indicator_common.dart';

// ignore: must_be_immutable
class CarouselImage extends StatelessWidget {
  List<Widget> items;
  CarouselController? controller;
  bool indecator;
  int current;
  CarouselOptions? options;
  CarouselImage({
    super.key,
    required this.items,
    this.controller,
    this.current = 0,
    this.indecator = false,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: items,
          carouselController: controller,
          options: options ?? CarouselOptions(),
        ),
        indecator
            ? IndicatorCommon(
                controller: controller!,
                current: current,
                count: items.length,
              )
            : Container()
      ],
    );
  }
}
