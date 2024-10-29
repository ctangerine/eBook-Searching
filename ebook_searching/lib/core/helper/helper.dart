class Helper {
  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }
}
