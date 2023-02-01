import 'Setting.dart';
import 'User.dart';

class LoginResponse {
  LoginResponse({
      String? token, 
      User? user, 
      Setting? setting,}){
    _token = token;
    _user = user;
    _setting = setting;
}

  LoginResponse.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _setting = json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }
  String? _token;
  User? _user;
  Setting? _setting;
LoginResponse copyWith({  String? token,
  User? user,
  Setting? setting,
}) => LoginResponse(  token: token ?? _token,
  user: user ?? _user,
  setting: setting ?? _setting,
);
  String? get token => _token;
  User? get user => _user;
  Setting? get setting => _setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_setting != null) {
      map['setting'] = _setting?.toJson();
    }
    return map;
  }

}


