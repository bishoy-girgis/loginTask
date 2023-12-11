import 'package:flutter/cupertino.dart';

class User {
  String? token;
  String?  tokenType;

  User._({ this.token,this.tokenType});

  static User? _this;

  factory User() {
    _this ??= User._();
    return _this!;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    if (_this == null) {
      _this = User._(
        token: json["access_token"],
        tokenType: json["token_type"],
      );
    } else {
      _this?.token = json["access_token"];
      _this?.tokenType = json["token_type"];
    }
    return _this!;
  }

  static printUser() {
    debugPrint(_this!.token);
    debugPrint(_this!.tokenType);
  }

  clearUser() {
    token = null;
    tokenType = null;
  }
}
