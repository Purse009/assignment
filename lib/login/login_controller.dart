import 'package:flutter/material.dart';
import 'package:riverpod_flutter/model/login_model.dart';
import 'package:riverpod_flutter/service/login_service.dart';

class LoginController with ChangeNotifier {
  bool passwordVisible = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginService _loginService = LoginService();

  passwordVidibleFuntion() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  Future<LoginModel> fetchLogin() async {
    var value = await _loginService.login(
        username: usernameController.text, password: passwordController.text);

    return value;
  }
}
