class User {
  User({
      this.id, 
      this.bio, 
      this.vip, 
      this.mobile, 
      this.use2fa, 
      this.username, 
      this.lastName, 
      this.firstName, 
      this.avatar,});

  User.fromJson(dynamic json) {
    id = json['id'];
    bio = json['bio'];
    vip = json['vip'];
    mobile = json['mobile'];
    use2fa = json['use_2fa'];
    username = json['username'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    avatar = json['avatar'];
  }
  int id;
  String bio;
  bool vip;
  String mobile;
  bool use2fa;
  String username;
  String lastName;
  String firstName;
  String avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bio'] = bio;
    map['vip'] = vip;
    map['mobile'] = mobile;
    map['use_2fa'] = use2fa;
    map['username'] = username;
    map['last_name'] = lastName;
    map['first_name'] = firstName;
    map['avatar'] = avatar;
    return map;
  }

}