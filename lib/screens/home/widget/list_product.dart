import "package:flutter/material.dart";
import "package:banana_clone/common/listview_item.dart";
import "package:banana_clone/constructor/dimension.dart";
import "package:banana_clone/screens/home/controller/home_controller.dart";
import "package:get/get.dart";

class ListProducts extends StatefulWidget {
  const ListProducts({
    super.key,
  });

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ฮิตติดลมบน! Best Seller⚡",
                style: TextStyle(
                  fontSize: Dimensions.font20(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: Dimensions.font12(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: Dimensions.font16(context),
                                color: Colors.grey[500],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        GetBuilder<HomeController>(builder: (data) {
          if (data.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListViewItem(
            products: data.productList,
          );
        }),
      ],
    );
  }
}
