class LoginResponse {
  Encoded? encoded;
  int? jrn;

  LoginResponse({this.encoded, this.jrn});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    encoded =
    json['encoded'] != null ? new Encoded.fromJson(json['encoded']) : null;
    jrn = json['jrn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.encoded != null) {
      data['encoded'] = this.encoded!.toJson();
    }
    data['jrn'] = this.jrn;
    return data;
  }
}

class Encoded {
  Data? data;
  bool? isError;
  Error? error;

  Encoded({this.data, this.isError, this.error});

  Encoded.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    isError = json['isError'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['isError'] = this.isError;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? accessTokenExpiresAt;
  String? refreshToken;
  String? refreshTokenExpiresAt;
  String? client;
  User? user;
  String? userid;

  Data(
      {this.accessToken,
        this.accessTokenExpiresAt,
        this.refreshToken,
        this.refreshTokenExpiresAt,
        this.client,
        this.user,
        this.userid});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    accessTokenExpiresAt = json['accessTokenExpiresAt'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiresAt = json['refreshTokenExpiresAt'];
    client = json['client'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['accessTokenExpiresAt'] = this.accessTokenExpiresAt;
    data['refreshToken'] = this.refreshToken;
    data['refreshTokenExpiresAt'] = this.refreshTokenExpiresAt;
    data['client'] = this.client;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['userid'] = this.userid;
    return data;
  }
}

class User {
  String? email;

  User({this.email});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class Error {
  int? code;
  String? message;
  String? errMsg;

  Error({this.code, this.message, this.errMsg});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    errMsg = json['errMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['errMsg'] = this.errMsg;
    return data;
  }
}