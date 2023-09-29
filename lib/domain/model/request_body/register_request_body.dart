class RegisterRequestBody {
  String name;
  String email;
  String password;
  String rePassword;
  String phoneNumber;

  // Default constructor
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['rePassword'] = rePassword;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
