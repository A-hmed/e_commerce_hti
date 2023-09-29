class AuthResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  AuthResponse({this.message, this.user, this.token, this.statusMsg});

  AuthResponse.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"];
  }
}

class User {
  static String currentToken = "";
  String? name;
  String? email;
  String? role;

  User({this.name, this.email, this.role});

  User.fromJson(dynamic json) {
    name = json["name"];
    email = json["email"];
    role = json["role"];
  }
}
