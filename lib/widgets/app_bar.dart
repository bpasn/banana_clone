import 'package:flutter/material.dart';
import 'package:banana_clone/constructor/dimension.dart';

PreferredSizeWidget generateAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(Dimensions.height45(context) * 1.5),
    child: Container(
      alignment: Alignment.bottomCenter,
      child: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.85),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(right: 10),
                height: Dimensions.height20(context) * 2,
                width: Dimensions.height20(context) * 2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/icon.png"),
                )),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: Dimensions.height20(context) * 2,
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search product here",
                      hintStyle: TextStyle(
                          fontFamily: "sukumvit",
                          fontSize: Dimensions.font12(context),
                          fontWeight: FontWeight.w500),
                      prefixIcon: InkWell(
                        onTap: () => {},
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                          size: 23,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(left: 5, right: 5),
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(left: 10),
              height: Dimensions.height20(context) * 1.9,
              width: Dimensions.height20(context) * 1.9,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black.withOpacity(0.8),
                size: Dimensions.font26(context),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
