class AppConfig {
  // Singleton instance
  static final AppConfig _instance = AppConfig._internal();

  // Trạng thái của biến isPassAPI
  bool isPassAPI = false;

  // Constructor
  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();
}
