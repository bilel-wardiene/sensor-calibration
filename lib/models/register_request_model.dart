class RegisterRequestModel {
  RegisterRequestModel({
    this.userName,
    this.password,
    this.email,
  });
  late final String? userName;
  late final String? password;
  late final String? email;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}
