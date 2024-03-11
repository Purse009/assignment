import 'package:riverpod_flutter/service/home_service.dart';
import '../app_import.dart';

class HomePageController with ChangeNotifier {
  final HomeService _homeService = HomeService();

  String fetchValue = "";

  Future<String> fetchData({required String token}) async {
    fetchValue = await _homeService.fetchData(token: token);
    notifyListeners();
    return fetchValue;
  }
}
