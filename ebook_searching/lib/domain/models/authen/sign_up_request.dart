class SignUpRequest {
  static const String example = """
    "email": "<string>",
    "password": "<string>",
    "username": "<string>"
  """;

  late final String email;
  late final String password;
  late final String username;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.username,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['username'] = username;
    return _data;
  }
}
