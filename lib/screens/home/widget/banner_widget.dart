import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:banana_clone/common/carouse_image.dart';
import 'package:banana_clone/constructor/dimension.dart';
import 'package:banana_clone/constructor/global_variables.dart';

class BannerApp extends StatefulWidget {
  const BannerApp({super.key});

  @override
  State<BannerApp> createState() => _BannerAppState();
}

class _BannerAppState extends State<BannerApp> {
  CarouselController controller = CarouselController();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselImage(
      items: GlobalVariables.carouselImages
          .map(
            (item) => SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                item,
                fit: BoxFit.fill,
              ),
            ),
          )
          .toList(),
      indecator: true,
      controller: controller,
      current: current,
      options: CarouselOptions(
        height: Dimensions.screenWidht(context) / 3,
        viewportFraction: 1,
        onPageChanged: (index, reason) => setState(() => current = index),
      ),
    );
  }
}
