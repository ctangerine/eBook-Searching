class SearchBookParam {
  static const String example = """
    "keyword": "<string>",
    "genreId": <int>,
    "genreSlug": "<string>",
    "limit": <int>,
    "offset": <int>,
    "orderBy": "<string>",
    "orderDirection": "<string>"
  """;

  late final String keyword;
  late final int genreId;
  late final String genreSlug;
  late final int limit;
  late final int offset;
  late final String orderBy;
  late final String orderDirection;

  SearchBookParam({
    required this.keyword,
    required this.genreId,
    required this.genreSlug,
    required this.limit,
    required this.offset,
    required this.orderBy,
    required this.orderDirection,
  });

  SearchBookParam.fromJson(Map<String, dynamic> json) {
    keyword = json["keyword"];
    genreId = json["genreId"];
    genreSlug = json["genreSlug"];
    limit = json["limit"];
    offset = json["offset"];
    orderBy = json["orderBy"];
    orderDirection = json["orderDirection"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['keyword'] = keyword;
    _data['genreId'] = genreId;
    _data['genreSlug'] = genreSlug;
    _data['limit'] = limit;
    _data['offset'] = offset;
    _data['orderBy'] = orderBy;
    _data['orderDirection'] = orderDirection;
    return _data;
  }
}
