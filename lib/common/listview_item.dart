// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:banana_clone/common/card_item.dart";
import "package:banana_clone/common/indicator_listview.dart";
import "package:banana_clone/constructor/dimension.dart";
import "package:banana_clone/routes/router_app.dart";
import "package:banana_clone/screens/home/schema/product.dart";
import "package:banana_clone/utils/format_number.dart";
import "package:get/get.dart";

class ListViewItem extends StatefulWidget {
  List<Product> products;

  ListViewItem({super.key, required this.products});

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  ScrollController scrollController = ScrollController();
  double scrollOffset = 0;
  int current = 0;
  double maxContent = 0;
  void scrollListen() {
    setState(() {
      maxContent = scrollController.position.maxScrollExtent;
      scrollOffset = scrollController.offset;
      current = ((scrollOffset) /
                  (maxContent / (widget.products.length / 2.5).ceil()))
              .ceil() -
          1;
      if (current < 0) {
        current = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListen);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height120(context) * 2.5,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,
            itemBuilder: (_, int index) {
              Product p = widget.products[index];
              return GestureDetector(
                onTap: () => Get.toNamed(RouterApp.getProductDetail(p.id)),
                child: CardItem(
                  image: p.image,
                  title: p.title,
                  price: p.price.toInt() * 35,
                  textFooter: Utils.formatNumberToString(p.price.toInt() * 35),
                  textFooterDecoration: TextDecoration.lineThrough,
                ),
              );
            },
          )),
          SizedBox(height: Dimensions.height10(context)),
          IndicatorListView(
            indicator: (widget.products.length ~/ 2.5).ceil(),
            current: current,
          )
        ],
      ),
    );
  }
}
