import 'package:flutter/material.dart';
import 'package:banana_clone/common/listview_item.dart';
import 'package:banana_clone/constructor/dimension.dart';
import 'package:banana_clone/screens/home/controller/home_controller.dart';
import 'package:get/get.dart';

class Trending extends StatefulWidget {
  const Trending({
    super.key,
  });

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: Dimensions.height120(context) * 2.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending, Grab it Now!",
            style: TextStyle(
                fontSize: Dimensions.font26(context),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Dimensions.height10(context)),
          Expanded(
            child: GetBuilder<HomeController>(builder: (data) {
              if (data.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListViewItem(
                products: data.productList,
              );
            }),
          ),
          SizedBox(height: Dimensions.height10(context)),
        ],
      ),
    );
  }
}
