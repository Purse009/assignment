import 'package:dio/dio.dart';
import 'package:riverpod_flutter/service/api_path.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Dio dio = Dio();

  Future<String> fetchData({required String token}) async {
    String uri = Uri.decodeFull(ApiPath.fetchData);
    try {
      final response =
          await http.get(Uri.parse(uri), headers: {"Authorization": token});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      return error.toString();
    }
  }
}
