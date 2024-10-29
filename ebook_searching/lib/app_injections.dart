import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/data/datasources/app_shared_prefs.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
