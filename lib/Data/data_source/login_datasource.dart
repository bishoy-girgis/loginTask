import 'package:dio/dio.dart';

class LoginDataSource {
  Dio dio = Dio();


  Future<Response> login(String email, String password) {
    return dio.post("https://my-safe-space.alacrity.technology/api/login", data: {
      "email": email,
      "password": password,
    });
  }

}
