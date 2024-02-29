import "dart:convert";

import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:banana_clone/common/Indicator_common.dart';
import "package:banana_clone/constructor/dimension.dart";
import "package:banana_clone/screens/home/model/list_categories.dart";

class CategoriesMenu extends StatefulWidget {
  const CategoriesMenu({super.key});

  @override
  State<CategoriesMenu> createState() => _CategoriesMenuState();
}

class _CategoriesMenuState extends State<CategoriesMenu> {
  List<CategoriesListModel> categories = [];

  CarouselController controller = CarouselController();
  int current = 0;
  @override
  void initState() {
    super.initState();
    setCategory();
  }

  void setCategory() async {
    String data = await rootBundle.loadString("assets/categories_list.json");
    List<dynamic> json = jsonDecode(data);
    for (Map<String, dynamic> item in json) {
      setState(() => categories.add(
          CategoriesListModel(image: item['image']!, label: item['label']!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
          child: categories.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CarouselSlider(
                  carouselController: controller,
                  items: [0, 1].map((e) {
                    List<CategoriesListModel> items = categories.isNotEmpty
                        ? categories.sublist(e * 10, (e + 1) * 10)
                        : [];
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.height3(context)),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.29),
                        itemCount: 10,
                        itemBuilder: (_, int index) {
                          CategoriesListModel item = items[index];
                          return _builder(context, item);
                        },
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) =>
                        {setState(() => current = index)},
                    viewportFraction: 1,
                  ),
                ),
        ),
        IndicatorCommon(
          controller: controller,
          current: current,
          count: 2,
        )
      ],
    );
  }

  Widget _builder(BuildContext context, CategoriesListModel item) {
    return GestureDetector(
      onTap: () => print("ITEM IS : ${item.image}"),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: Dimensions.screenWidht(context) / 8.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                width: Dimensions.width30(context) * 1.2,
                height: Dimensions.width30(context) * 1.2,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10(context)),
          Flexible(
            child: Text(
              item.label,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: Dimensions.screenWidht(context) / 33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
