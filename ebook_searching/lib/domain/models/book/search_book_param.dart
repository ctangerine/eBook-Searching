class SearchBookParam {
  static const String example = """
    "keyword": "<string>",
    "genreId": <int>,
    "limit": <int>,
    "offset": <int>,
    "orderBy": "<string>",
    "orderDirection": "<string>"
  """;

  late final String? keyword;
  late final int? genreId;
  late final int? limit;
  late final int? offset;
  late final String? orderBy;
  late final String? orderDirection;

  SearchBookParam({
    this.keyword,
    this.genreId,
    this.limit,
    this.offset,
    this.orderBy,
    this.orderDirection,
  });

  SearchBookParam.fromJson(Map<String, dynamic> json) {
    keyword = json["keyword"];
    genreId = json["genreId"];
    limit = json["limit"];
    offset = json["offset"];
    orderBy = json["orderBy"];
    orderDirection = json["orderDirection"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['keyword'] = keyword;
    data['genreId'] = genreId;
    data['limit'] = limit;
    data['offset'] = offset;
    data['orderBy'] = orderBy;
    data['orderDirection'] = orderDirection;
    return data;
  }

  static SearchBookParam noParams() {
    return SearchBookParam(
    );
  }

  // copyWith method
  SearchBookParam copyWith({
    String? keyword,
    int? genreId,
    int? limit,
    int? offset,
    String? orderBy,
    String? orderDirection,
  }) {
    return SearchBookParam(
      keyword: keyword ?? this.keyword,
      genreId: genreId ?? this.genreId,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      orderBy: orderBy ?? this.orderBy,
      orderDirection: orderDirection ?? this.orderDirection,
    );
  }
}
