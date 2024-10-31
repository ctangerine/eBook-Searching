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
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    return data;
  }
}
