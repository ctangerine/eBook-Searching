import 'package:ebook_searching/app_routes.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_state.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/screens/signin_screen.dart';
import 'package:ebook_searching/presentation/screens/signup_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenBloc, AuthenState>(
      listener: (context, state) {
        if (state is AuthenSuccess) {
          Navigator.pushNamed(context, AppRoutes.homePage);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Center(
              child: Column(
                children: [
                  _buildHeroImage(context),
                  const SizedBox(height: 30),
                  _buildGreetings(),
                  const SizedBox(height: 40),
                  _buildSigninLinkButton(context),
                  const SizedBox(height: 10),
                  _buildRegisterLinkButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage(Bui) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(signinImage), // Ảnh của bạn
            Positioned.fill(
              left: -10,
              right: -10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 170,  // 1/3 chiều cao của ảnh
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color.fromARGB(255, 255, 255, 255), 
                        const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                        const Color.fromARGB(255, 255, 255, 255).withOpacity(0),           // Trong suốt ở trên
                      ],
                      stops: const [0.0,0.5, 1.0],  // Vị trí gradient thay đổi
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGreetings() {
    return Column(
      children: [
        const SizedBox(
          width: 360,
          child: Text(
            'Borrow library books\neasily and quickly!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 360,
          child: Text(
            'Borrow library books easily and conveniently, with\nquick access anytime, anywhere.',
            textAlign: TextAlign.center,
            style: AppTextStyles.description2Regular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSigninLinkButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton(
        onPressed: () {
          // navigate to signin screen
          Future.delayed(const Duration(seconds: 2));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SigninScreen())
          );
        },
        child: const Text('Get started'),
      ),
    );
  }

  Widget _buildRegisterLinkButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          Future.delayed(const Duration(seconds: 2));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupScreen())
          );
        },
        child: const Text('I\'m new, sign me up'),
      ),
    );
  }
}