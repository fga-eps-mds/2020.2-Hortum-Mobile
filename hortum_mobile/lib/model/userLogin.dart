class UserLogin {
  final String email;
  final String password;

  UserLogin({this.email, this.password});

  UserLogin.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
