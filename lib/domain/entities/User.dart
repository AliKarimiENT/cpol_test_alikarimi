class User {
  User({
    num? id,
    String? bio,
    bool? vip,
    String? mobile,
    bool? use2fa,
    String? username,
    String? lastName,
    String? firstName,
    String? avatar,}){
    _id = id;
    _bio = bio;
    _vip = vip;
    _mobile = mobile;
    _use2fa = use2fa;
    _username = username;
    _lastName = lastName;
    _firstName = firstName;
    _avatar = avatar;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _bio = json['bio'];
    _vip = json['vip'];
    _mobile = json['mobile'];
    _use2fa = json['use_2fa'];
    _username = json['username'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _avatar = json['avatar'];
  }
  num? _id;
  String? _bio;
  bool? _vip;
  String? _mobile;
  bool? _use2fa;
  String? _username;
  String? _lastName;
  String? _firstName;
  String? _avatar;
  User copyWith({  num? id,
    String? bio,
    bool? vip,
    String? mobile,
    bool? use2fa,
    String? username,
    String? lastName,
    String? firstName,
    String? avatar,
  }) => User(  id: id ?? _id,
    bio: bio ?? _bio,
    vip: vip ?? _vip,
    mobile: mobile ?? _mobile,
    use2fa: use2fa ?? _use2fa,
    username: username ?? _username,
    lastName: lastName ?? _lastName,
    firstName: firstName ?? _firstName,
    avatar: avatar ?? _avatar,
  );
  num? get id => _id;
  String? get bio => _bio;
  bool? get vip => _vip;
  String? get mobile => _mobile;
  bool? get use2fa => _use2fa;
  String? get username => _username;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bio'] = _bio;
    map['vip'] = _vip;
    map['mobile'] = _mobile;
    map['use_2fa'] = _use2fa;
    map['username'] = _username;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['avatar'] = _avatar;
    return map;
  }

}