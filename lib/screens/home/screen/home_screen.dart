import 'package:flutter/material.dart';
import 'package:banana_clone/constructor/dimension.dart';
import 'package:banana_clone/screens/home/controller/home_controller.dart';
import 'package:banana_clone/screens/home/widget/banner_widget.dart';
import 'package:banana_clone/screens/home/widget/categories_list_menu.dart';
import 'package:banana_clone/screens/home/widget/flash_sale.dart';
import 'package:banana_clone/screens/home/widget/popular_widget.dart';
import 'package:banana_clone/screens/home/widget/trending.dart';
import 'package:get/get.dart';

import '../widget/list_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getProducts();
    return RefreshIndicator(
      onRefresh: () async {
        await Get.find<HomeController>().getProducts();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BannerApp(),
            SizedBox(height: Dimensions.height20(context)),
            const Popular(),
            SizedBox(height: Dimensions.height20(context)),
            const CategoriesMenu(),
            SizedBox(height: Dimensions.height10(context)),
            const ListProducts(),
            SizedBox(height: Dimensions.height10(context)),
            const FlashSale(),
            SizedBox(height: Dimensions.height10(context)),
            const Trending(),
            SizedBox(height: Dimensions.height10(context)),
            SizedBox(height: Dimensions.height10(context) * 6),
          ],
        ),
      ),
    );
  }
}
