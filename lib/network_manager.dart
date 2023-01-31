class NetworkManager{
  static NetworkManager instance = NetworkManager();

  static const LOGIN_URL = 'http://88.135.36.18:7005/api/auth/mobile/login/';
  static const CODE_VERIFY_URL = 'http://88.135.36.18:7005/api/auth/mobile/verify/';
  static const TOKEN_VERIFY_URL = 'http://88.135.36.18:7005/api/token/verify/';
  static const EDIT_PROFILE_URL = 'http://88.135.36.18:7005/api/user/';
}