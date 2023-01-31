import 'User.dart';
import 'Setting.dart';

class LoginResponse {
  LoginResponse({
      this.token, 
      this.user, 
      this.setting,});

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    setting = json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }
  String token;
  User user;
  Setting setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user.toJson();
    }
    if (setting != null) {
      map['setting'] = setting.toJson();
    }
    return map;
  }

}