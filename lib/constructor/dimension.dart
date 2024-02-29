import 'package:flutter/material.dart';

class Dimensions {
  static double screenWidht(BuildContext c) => MediaQuery.of(c).size.width;
  static double screenHeight(BuildContext c) => MediaQuery.of(c).size.height;

  static double pageView(BuildContext c) => screenHeight(c) / 2.64;
  static double pageViewContainer(BuildContext c) => screenHeight(c) / 3.84;
  static double pageViewTextContainer(BuildContext c) => screenHeight(c) / 7.03;

  static double height2(BuildContext c) => screenHeight(c) / 442;
  static double height3(BuildContext c) => screenHeight(c) / 281.3;
  static double height10(BuildContext c) => screenHeight(c) / 84.4;
  static double height15(BuildContext c) => screenHeight(c) / 56.27;
  static double height20(BuildContext c) => screenHeight(c) / 42.2;
  static double height30(BuildContext c) => screenHeight(c) / 28.13;
  static double height45(BuildContext c) => screenHeight(c) / 18.76;
  static double height120(BuildContext c) => screenHeight(c) / 7.03;
  static double height220(BuildContext c) => screenHeight(c) / 3.87;
  static double height250(BuildContext c) => screenHeight(c) / 3.51;
  static double height270(BuildContext c) => screenHeight(c) / 3.12;
  static double height275(BuildContext c) => screenHeight(c) / 3.06;
  static double height300(BuildContext c) => screenHeight(c) / 2.81;

  //dynamic width margin padding
  static double width5(BuildContext c) => screenHeight(c) / 133.5;
  static double width10(BuildContext c) => screenHeight(c) / 84.4;
  static double width15(BuildContext c) => screenHeight(c) / 56.27;
  static double width20(BuildContext c) => screenHeight(c) / 42.2;
  static double width30(BuildContext c) => screenHeight(c) / 28.13;
  static double width45(BuildContext c) => screenHeight(c) / 18.76;
  static double width180(BuildContext c) => screenWidht(c) / 4.68;
  static double width350(BuildContext c) => screenWidht(c) / 1.12;

//dynamic font
  static double font10(BuildContext c) => screenHeight(c) / 85.3;
  static double font12(BuildContext c) => screenHeight(c) / 55.3;
  static double font16(BuildContext c) => screenHeight(c) / 56.73;
  static double font20(BuildContext c) => screenHeight(c) / 42.2;
  static double font26(BuildContext c) => screenHeight(c) / 32.46;

//dynamic radius
  static double radius15(BuildContext c) => screenHeight(c) / 56.27;
  static double radius20(BuildContext c) => screenHeight(c) / 42.2;
  static double radius30(BuildContext c) => screenHeight(c) / 28.13;

  static double iconSize24(BuildContext c) => screenHeight(c) / 35.17;
  static double iconSize16(BuildContext c) => screenHeight(c) / 52.75;

  // ignore: non_constant_identifier_names
  static double ListViewImgSize(BuildContext c) => screenWidht(c) / 3.25;
  // ignore: non_constant_identifier_names
  static double ListViewTextSize(BuildContext c) => screenWidht(c) / 3.9;

  // ignore: non_constant_identifier_names
  static double PopularFoodImaSize(BuildContext c) => screenHeight(c) / 2.41;

  static double buttonHeightBar(BuildContext c) => screenHeight(c) / 7.03;
}
