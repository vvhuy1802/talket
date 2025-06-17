class LoginResponse {
  String? _accessToken;
  String? _refreshToken;
  User? _user;

  LoginResponse({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _user = user;
  }

  LoginResponse.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  LoginResponse copyWith({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) =>
      LoginResponse(
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
        user: user ?? _user,
      );

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    map['user'] = _user?.toJson();
    return map;
  }
}

class User {
  String? _id;
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _avatar;

  User({
    String? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? avatar,
  }) {
    _id = id;
    _name = name;
    _phoneNumber = phoneNumber;
    _email = email;
    _avatar = avatar;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phoneNumber = json['phoneNumber'];
    _email = json['email'];
    _avatar = json['avatar'];
  }

  String? get id => _id;

  String? get name => _name;

  String? get phoneNumber => _phoneNumber;

  String? get email => _email;

  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phoneNumber'] = _phoneNumber;
    map['email'] = _email;
    map['avatar'] = _avatar;
    return map;
  }
}
