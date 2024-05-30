
class LoginRequest {
  String authorization = "application:secret";
  String grantType = "password";
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    authorization = json['authorization'];
    grantType = json['grant_type'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization'] = this.authorization;
    data['grant_type'] = this.grantType;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
