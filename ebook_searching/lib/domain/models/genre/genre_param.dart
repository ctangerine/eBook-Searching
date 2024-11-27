class GenreParam {
  static const String example = """
    "limit": <int>,
    "offset": <int>,
    "orderBy": "<string>",
    "orderDirection": "<string>"
  """;

  late final int? limit;
  late final int? offset;
  late final String? orderBy;
  late final String? orderDirection;

  GenreParam({
    this.limit,
    this.offset,
    this.orderBy,
    this.orderDirection,
  });

  GenreParam.fromJson(Map<String, dynamic> json) {
    limit = json["limit"];
    offset = json["offset"];
    orderBy = json["orderBy"];
    orderDirection = json["orderDirection"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['limit'] = limit;
    data['offset'] = offset;
    data['orderBy'] = orderBy;
    data['orderDirection'] = orderDirection;
    return data;
  }
}
