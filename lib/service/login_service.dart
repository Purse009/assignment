import 'package:dio/dio.dart';
import 'package:riverpod_flutter/model/login_model.dart';
import 'package:riverpod_flutter/service/api_path.dart';

class LoginService {
  Future<LoginModel> login(
      {required String username, required String password}) async {
    LoginModel value = LoginModel();
    try {
      Response response = await Dio().post(ApiPath.login,
          data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        value = LoginModel.fromMap(response.data);
        return value;
      }
      return value;
    } on DioException catch (e) {
      return LoginModel(message: e.message ?? "error");
    }
  }
}
