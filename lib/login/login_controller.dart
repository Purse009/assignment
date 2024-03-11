import '../app_import.dart';
import '../const/app_import.dart';

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
