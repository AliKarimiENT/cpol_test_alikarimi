import 'dart:convert';

import 'package:cpol_test_alikarimi/domain/repositories/user_repository.dart';
import 'package:cpol_test_alikarimi/network_manager.dart';
import 'package:dio/dio.dart';

class DataUserRepository extends UserRepository {
  var dio = Dio();
  @override
  Future<void> editProfile(String firstName, String? lastName, String? bio) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<void> login(String phone) async {
    try {
      var body = Map<String, String>();
      body.putIfAbsent('mobile', () => phone);
      Response response = await dio.post(
        NetworkManager.LOGIN_URL,
        queryParameters: body,
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.data);
      }
    } catch (e) {}
  }

  @override
  Future<void> verifyCode(String mobile, String code) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyToken(String token) {
    // TODO: implement verifyToken
    throw UnimplementedError();
  }
}
