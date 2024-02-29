import 'package:flutter/material.dart';
import 'package:banana_clone/constructor/dimension.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  int page;
  Function(int) onTab;
  BottomBar({super.key, required this.page, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: Dimensions.height45(context) * 1.8,
      elevation: 0.0,
      child: Row(
        children: [
          navItem(NavModelItem(
              icon: Icons.storefront_outlined,
              selected: page == 0,
              label: "Home",
              context: context,
              onTap: () => onTab(0))),
          navItem(NavModelItem(
              icon: Icons.format_list_bulleted,
              selected: page == 1,
              label: "Categories",
              context: context,
              onTap: () => onTab(1))),
          navItem(NavModelItem(context: context)),
          navItem(NavModelItem(
              icon: Icons.shopping_cart_outlined,
              selected: page == 2,
              label: "Shop",
              context: context,
              onTap: () => onTab(2))),
          navItem(NavModelItem(
              icon: Icons.person_outline_outlined,
              selected: page == 3,
              label: "Account",
              context: context,
              onTap: () => onTab(3))),
        ],
      ),
    );
  }
}

class NavModelItem {
  IconData? icon;
  bool? selected;
  String? label;
  BuildContext context;
  Function()? onTap;

  NavModelItem(
      {this.icon,
      this.selected,
      this.label,
      required this.context,
      this.onTap});
}

Widget navItem(NavModelItem option) {
  return Expanded(
    child: GestureDetector(
      onTap: option.icon == null ? null : option.onTap,
      child: option.icon == null
          ? Container()
          : Column(
              children: [
                Expanded(
                  child: Icon(
                    option.icon,
                    color: option.selected!
                        ? Colors.amber.withOpacity(0.9)
                        : Colors.black.withOpacity(0.4),
                    size: Dimensions.font12(option.context) * 2,
                  ),
                ),
                SizedBox(height: Dimensions.height10(option.context)),
                Text(
                  option.label!,
                  style: TextStyle(
                    fontSize: Dimensions.font12(option.context),
                  ),
                )
              ],
            ),
    ),
  );
}
