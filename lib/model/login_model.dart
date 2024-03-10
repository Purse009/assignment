class LoginModel {
  String? token;
  String? message;

  LoginModel({this.token, this.message});

  factory LoginModel.fromMap(Map<String, dynamic> json) =>
      LoginModel(token: json['token'], message: json['Message']);
}
