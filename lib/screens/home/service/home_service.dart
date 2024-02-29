import 'package:banana_clone/constructor/app_constant.dart';
import 'package:banana_clone/constructor/global_variables.dart';
import 'package:banana_clone/utils/api_client.dart';
import 'package:get/get.dart';

class HomeService {
  final ApiClient apiClient;
  HomeService({required this.apiClient});
  Future<List<String>> getBanner() {
    return Future.delayed(
        const Duration(seconds: 2), () => GlobalVariables.carouselImages);
  }

  Future<Response> getData() async {
    print(AppConstant.products);
    return apiClient.getData(AppConstant.products);
  }
}
