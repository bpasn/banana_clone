import "package:flutter/material.dart";
import "package:banana_clone/common/card_item.dart";
import "package:banana_clone/common/indicator_listview.dart";
import "package:banana_clone/common/listview_item.dart";
import "package:banana_clone/constructor/dimension.dart";
import "package:banana_clone/screens/home/controller/home_controller.dart";
import "package:get/get.dart";

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: Dimensions.height300(context) * 1.5,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: Dimensions.height45(context) * 1.5,
            padding: EdgeInsets.all(Dimensions.height10(context)),
            margin:
                EdgeInsets.symmetric(vertical: Dimensions.height10(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                generateFlashBannerCountdown(context),
                seeMore(context)
              ],
            ),
          ),
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
        ],
      ),
    );
  }

  SizedBox seeMore(BuildContext context) {
    return SizedBox(
      width: Dimensions.width45(context) * 1.8,
      child: GestureDetector(
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
      ),
    );
  }

  Row generateFlashBannerCountdown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Dimensions.width45(context) * 1.5,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://inwfile.com/s-df/ide7np.png"))),
        ),
        Container(
          alignment: Alignment.center,
          width: Dimensions.width45(context) * 4,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              generateCountdown(context, "00", "days"),
              generateCountdown(context, "00", "hrs"),
              generateCountdown(context, "00", "mins"),
              generateCountdown(context, "00", "secs"),
            ],
          ),
        ),
      ],
    );
  }

  Expanded generateCountdown(BuildContext context, String value, String sec) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: Dimensions.font16(context)),
          ),
          Text(
            sec,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: Dimensions.font10(context) + 1.5),
          )
        ],
      ),
    );
  }
}
