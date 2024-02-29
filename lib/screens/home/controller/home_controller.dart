import 'dart:convert';
import 'package:banana_clone/screens/home/schema/product.dart';
import 'package:get/get.dart';

import '../service/home_service.dart';

class HomeController extends GetxController {
  final HomeService homeService;

  get _homeService => homeService;

  HomeController({required this.homeService});
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getProducts() async {
    try {
      _productList = [];
      Response response = await homeService.getData();
      _loading = true;
      update();
      if (response.statusCode == 200) {
        for (final product in response.body) {
          Product prod = Product.fromJson(jsonEncode(product));
          productList.add(prod);
        }
      }
    } on Exception catch (e) {
      print("Error To String : ${e.toString()}");
    } finally {
      update();
      _loading = false;
    }
  }
}
