import 'package:flutter/material.dart';
import 'package:banana_clone/common/indicator_listview.dart';
import 'package:banana_clone/common/separator.dart';
import 'package:banana_clone/constructor/dimension.dart';
import 'package:banana_clone/screens/home/controller/home_controller.dart';
import 'package:banana_clone/screens/home/schema/product.dart';
import 'package:banana_clone/utils/format_number.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});
  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double opacity = 0.0;
  double opacityMax = 0.1;
  double offset = 0.0;
  final ScrollController _scrollview = ScrollController();
  Color backgroundColorSearch = Colors.amber;
  Color backgroundColor = Colors.transparent;
  @override
  void initState() {
    super.initState();
    _scrollview.addListener(scrollListen);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollview.dispose();
  }

  void scrollListen() {
    final scrollOf = _scrollview.offset;
    if (scrollOf >= 0.00) {
      //up
      if (opacity < 1.0) {
        opacity = double.parse((opacity + opacityMax).toStringAsFixed(2));
      }
    } else if (scrollOf < 60) {
      //down
      if (opacity > 0.0) {
        opacity = double.parse((opacity - opacityMax).toStringAsFixed(2));
      }
    }
    setState(() {
      if (scrollOf <= 0) {
        backgroundColor = Colors.amber;
        opacity = 0.0;
        offset = 0.0;
      }
      print(opacity);
      backgroundColor = Colors.amber.withOpacity(opacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(opacity);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollview,
            child: GetBuilder<HomeController>(
              builder: (controller) {
                Product p = controller.productList.firstWhere(
                  (element) => element.id == widget.id,
                );
                return Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10(context)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              productImage(context, p),
                              SizedBox(
                                  height: Dimensions.height10(context) * 3),
                              const IndicatorListView(
                                current: 0,
                                indicator: 2,
                              ),
                              SizedBox(
                                  height: Dimensions.height10(context) * 3),
                              productTitle(p, context),
                              brandAndSKU(context),
                              SizedBox(
                                  height: Dimensions.height20(context) * 1.8),
                              price(p, context),
                              SizedBox(
                                  height: Dimensions.height10(context) - 5),
                              warranty(context),
                              SizedBox(
                                  height: Dimensions.height20(context) * 2),
                              mustHaveProduct(context, p),
                              SizedBox(
                                  height: Dimensions.height20(context) * 2),
                              productDescription(p, context),
                              SizedBox(
                                  height: Dimensions.height20(context) * 4),
                              const Separator(),
                              footerDetail(context),
                              SizedBox(height: Dimensions.height10(context)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20(context)),
                    Container(
                      height: Dimensions.height45(context) * 2,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Product Options (2)",
                                  style: TextStyle(
                                      fontSize: Dimensions.font20(context),
                                      color: Colors.grey[600]),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: generateColorOption(),
                              )),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30(context),
                    )
                    // TODO: Recent interested
                    // Widget here

                    // TODO: View together
                    // Widget here
                  ],
                );
              },
            ),
          ),
          header(context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        height: Dimensions.height45(context) * 1.8,
        child: Row(
          children: [
            SizedBox(
              width: Dimensions.width45(context) * 1.2,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.black.withOpacity(0.4),
                        size: Dimensions.font12(context) * 2,
                      ),
                    ),
                    SizedBox(height: Dimensions.height10(context)),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: Dimensions.font12(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10(context)),
            SizedBox(
              width: Dimensions.width45(context) * 1.2,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black.withOpacity(0.4),
                        size: Dimensions.font12(context) * 2,
                      ),
                    ),
                    SizedBox(height: Dimensions.height10(context)),
                    Text(
                      "wishlist",
                      style: TextStyle(
                        fontSize: Dimensions.font12(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10(context)),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: Dimensions.height30(context) * 1.2,
                  height: Dimensions.height30(context) * 1.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      color: Colors.amber.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.font12(context)),
                  ),
                ),
              ),
            ),
            SizedBox(width: Dimensions.width15(context)),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: Dimensions.height30(context) * 1.2,
                  height: Dimensions.height30(context) * 1.2,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Collect in 1 hour",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.font12(context) - 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateColorOption() {
    return ["#FFFFFF", "#000000"].map((String e) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: Dimensions.height20(context) * 1.5,
        height: Dimensions.height20(context) * 1.5,
        decoration: BoxDecoration(
            color: Color(int.parse(e.substring(1, 7), radix: 16) + 0x80000000),
            border: Border.all(
              color: (Colors.grey),
            ),
            borderRadius: BorderRadius.circular(100)),
      );
    }).toList();
  }

  Container header(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      height: Dimensions.height45(context) * 2.35,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                alignment: Alignment.center,
                width: Dimensions.height45(context) - 5,
                height: Dimensions.height45(context) - 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.amber,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  weight: 1.0,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: Dimensions.height45(context) - 5,
                decoration: BoxDecoration(
                  color: opacity == 1.0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height15(context)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: Dimensions.font26(context),
                        color:
                            opacity == 1.0 ? Colors.grey : Colors.transparent,
                      ),
                      Text(
                        "Search product here",
                        style: TextStyle(
                            fontSize: Dimensions.font16(context),
                            color: opacity == 1.0
                                ? Colors.grey[600]
                                : Colors.transparent,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: Dimensions.height45(context) - 5,
              height: Dimensions.height45(context) - 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10(context) - 5),
              child: Icon(
                Icons.share_outlined,
                size: Dimensions.font26(context),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: Dimensions.height45(context) - 5,
              height: Dimensions.height45(context) - 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10(context) - 5),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: Dimensions.font26(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text productDescription(Product p, BuildContext context) {
    return Text(
      p.description,
      style: TextStyle(
        fontSize: Dimensions.font20(context),
      ),
    );
  }

  Padding footerDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.currency_exchange_outlined,
                        color: Colors.grey[400],
                        size: Dimensions.font20(context),
                      ),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: Dimensions.width10(context),
                    )),
                    TextSpan(
                        text: "Compare",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font12(context)))
                  ]),
                ),
                SizedBox(width: Dimensions.width10(context)),
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.grey[400],
                        size: Dimensions.font20(context),
                      ),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: Dimensions.width10(context),
                    )),
                    TextSpan(
                        text: "Add to wishlist",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font12(context)))
                  ]),
                )
              ],
            ),
          ),
          Icon(
            Icons.share_outlined,
            size: Dimensions.font20(context),
            color: Colors.grey[400],
            weight: 100,
          )
        ],
      ),
    );
  }

  Container mustHaveProduct(BuildContext context, Product p) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.9,
                child: Checkbox(value: false, onChanged: (c) => {}),
              ),
              Text(
                "Must have product",
                style: TextStyle(
                  fontSize: Dimensions.font16(context),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const Separator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: Dimensions.width45(context),
                  height: Dimensions.width45(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(p.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        p.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimensions.font16(context),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font16(
                                    context,
                                  ),
                                ),
                                text: Utils.formatNumberToString(
                                  p.price.toInt() * 35,
                                ),
                              ),
                              const WidgetSpan(
                                child: SizedBox(width: 10),
                              ),
                              TextSpan(
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimensions.font10(
                                          context,
                                        ) *
                                        1.2,
                                    decoration: TextDecoration.lineThrough),
                                text: Utils.formatNumberToString(
                                  p.price.toInt() * 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container warranty(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        "1 yearwarranty avaliable",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: Dimensions.font12(context),
            color: Colors.grey[400],
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Container price(Product p, BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        Utils.formatNumberToString(p.price.toInt() * 35),
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: Dimensions.font26(context),
            color: Colors.red[400],
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Container brandAndSKU(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        "Brand: VEGER | SKU: 8859531900363",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: Dimensions.font16(context),
            color: Colors.grey[400],
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Text productTitle(Product p, BuildContext context) {
    return Text(
      p.title,
      style: TextStyle(
          fontSize: Dimensions.font26(context),
          color: Colors.black,
          fontWeight: FontWeight.w600),
    );
  }

  Container productImage(BuildContext context, Product p) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height20(context) * 4),
      child: Container(
        width: Dimensions.height120(context) * 1.9,
        height: Dimensions.screenHeight(context) / 2.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              p.image,
            ),
          ),
        ),
      ),
    );
  }
}
