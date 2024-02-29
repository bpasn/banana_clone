import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, dynamic> _mainheader;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = "";
    _mainheader = {
      'Content-type': "application/json charset=UTF-8",
      'Authorization': "Bearer $token"
    };
  }

  Future<Response> getData(String url) async {
    try {
      return await get(url);
    } catch (e) {
      return Response(statusCode: 1,statusText:e.toString());
    }
  }
}
