class SignInRequest {
  static const String example = """
    "username": "<string>",
    "password": "<string>"
  """;

  late final String username;
  late final String password;

  SignInRequest({
    required this.username,
    required this.password,
  });

  SignInRequest.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
