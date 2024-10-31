import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class SignupSuccessfulScreen extends StatelessWidget {
  const SignupSuccessfulScreen ({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.maintheme,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeroImage(),
          _buildDescription(),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Image.asset(
      signupSuccess,
      width: 160,
      height: 160,
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Your account successfully created', style: AppTextStyles.title1Semibold,),
        const SizedBox(height: 10),
        Text(
          'Your account has successfully created. You can go to login page first to login into your account!', 
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary,),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return FilledButton(
      onPressed: () {

      }, 
      child: const Text('Yay! Continue')
    );
  }
}