class GenreParam {
  static const String example = """
    "limit": <int>,
    "offset": <int>,
    "orderBy": "<string>",
    "orderDirection": "<string>"
  """;

  late final int limit;
  late final int offset;
  late final String orderBy;
  late final String orderDirection;

  GenreParam({
    required this.limit,
    required this.offset,
    required this.orderBy,
    required this.orderDirection,
  });

  GenreParam.fromJson(Map<String, dynamic> json) {
    limit = json["limit"];
    offset = json["offset"];
    orderBy = json["orderBy"];
    orderDirection = json["orderDirection"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['limit'] = limit;
    _data['offset'] = offset;
    _data['orderBy'] = orderBy;
    _data['orderDirection'] = orderDirection;
    return _data;
  }
}
