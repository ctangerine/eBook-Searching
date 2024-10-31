class UpdateProfileRequest {
  static const String example = """
    "fullName": "<string>",
    "gender": "<string>",
    "dateOfBirth": "<string>"
  """;

  late final String fullName;
  late final String gender;
  late final String dateOfBirth;

  UpdateProfileRequest({
    required this.fullName,
    required this.gender,
    required this.dateOfBirth
  });

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    gender = json["gender"];
    dateOfBirth = json["dateOfBirth"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    return data;
  }
}