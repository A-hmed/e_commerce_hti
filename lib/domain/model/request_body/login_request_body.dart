class LoginRequestBody {
  String email;
  String password;

  // Default constructor
  LoginRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
