import 'package:banana_clone/constructor/app_constant.dart';
import 'package:banana_clone/screens/home/controller/home_controller.dart';
import 'package:banana_clone/screens/home/service/home_service.dart';
import 'package:banana_clone/utils/api_client.dart';
import 'package:get/get.dart';

Future<void> getXinit() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseUrl));

  Get.lazyPut(() => HomeService(apiClient: Get.find()));
  Get.lazyPut(() => HomeController(homeService: Get.find()));
}
