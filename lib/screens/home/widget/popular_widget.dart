import "package:flutter/material.dart";
import "package:banana_clone/constructor/dimension.dart";
import "package:banana_clone/constructor/global_variables.dart";
import "package:banana_clone/screens/home/controller/home_controller.dart";
import "package:get/get.dart";

class Popular extends StatelessWidget {
  const Popular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (data) {
      if (data.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SizedBox(
        height: Dimensions.screenWidht(context) / 4,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: GlobalVariables.carouselImages.length,
          itemBuilder: (context, index) => Container(
            width: Dimensions.screenWidht(context) / 1.5,
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    GlobalVariables.carouselImages[index],
                  )),
            ),
          ),
        ),
      );
    });
  }
}
