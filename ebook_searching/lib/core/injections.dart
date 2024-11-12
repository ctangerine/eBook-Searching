import 'package:ebook_searching/app_injections.dart';
import 'package:ebook_searching/core/log/app_logger.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/presentation/auth_injections.dart';
import 'package:ebook_searching/presentation/book_injections.dart';
import 'package:ebook_searching/presentation/genre_injections.dart';
import 'package:ebook_searching/presentation/library_injections.dart';
import 'package:ebook_searching/presentation/user_injections.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAppInjections();
  await initDioInjections();
  await initAuthInjections();
  await initBookInjections();
  await initUserInjections();
  await initGenreInjections();
  await initLibraryInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
