import 'package:banana_clone/screens/cart/screen/cart_screen.dart';
import 'package:banana_clone/screens/detail/detail_screen.dart';
import 'package:banana_clone/screens/home/screen/home_screen.dart';
import 'package:get/get.dart';

class RouterApp {
  static const String init = "/";
  static const String cart = "/cart";
  static const String productDetail = "/product/detail";

  static String getInitial() => "$init";
  static String getCart() => "$cart";
  static String getProductDetail(int id) => "$productDetail?id=${id}";

  static List<GetPage> routes = [
    GetPage(
        name: init,
        page: () => const HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: cart,
        page: () => const CartScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: productDetail,
        page: () {
          String id = Get.parameters['id']!;
          return DetailScreen(id: int.parse(id));
        },
        transition: Transition.rightToLeft)
  ];
}
