import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_bloc.dart';
import 'package:ebook_searching/presentation/screens/splash_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthenBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SafeArea(
          child: Scaffold(
            body: Center(
              child: SplashScreen()
            ),
          ),
        ),
      ),
    );
  }
}
