abstract class UserRepository {
  Future<bool> verifyToken(String token);
  Future<void> login(String phone);
  Future<void> verifyCode(String mobile,String code);
  Future<void> editProfile(String firstName,String? lastName, String? bio);

}