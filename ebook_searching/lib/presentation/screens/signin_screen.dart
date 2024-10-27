import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAppname(),
              _buildDescrition(),
              _buildLoginForm(context),
              _buildTermPart()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermPart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('By continuing, you agree to our', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary)),
            TextButton(
              onPressed: () {},
              child: Text('Terms of Service', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary)),
            ),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Read our ', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary)),
            TextButton(
              onPressed: () {},
              child: Text('Privacy Policy', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary)),
            ),
          ]
        ),
      ],
    );
  }

  Widget _buildAppname() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BookTudIcon(),
        Text('BookTud', style: AppTextStyles.heading2Semibold,)
      ],
    );
  }

  Widget _buildDescrition() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Welcome back!', style: AppTextStyles.heading2Semibold),
        const SizedBox(height: 10),
        Text('You can log into your account first to read many interesting books!', style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary,))
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,  // Attach the GlobalKey to the Form
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          emailTextFormField(context),
          const SizedBox(height: 20),
          const Text('Password', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          passwordTextFormField(context),
          const SizedBox(height: 20),
          _buildForgotPasswordLink(),
          const SizedBox(height: 10),
          _buildLoginButton(),
          const SizedBox(height: 10),
          _buildLoginWithGoogleButton()
        ],
      ),
    );
  }

  Row _buildLoginWithGoogleButton() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => {}, 
            child: const Text('Login with Google', 
              style: AppTextStyles.body2Semibold
            )
          ) ,
        )
      ],
    );
  }

  Row _buildLoginButton() {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            statesController: WidgetStatesController(_formKey.currentState != null ? {WidgetState.selected} : {WidgetState.disabled}),
            onPressed: () => {},
            child: const Text('Login', 
              style: AppTextStyles.body2Semibold
            )
          )
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Forgot your password?', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary),),
        TextButton(
          onPressed: () {},
          child: Text('Reset here', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary),),
        ),
      ],
    );
  }

  TextFormField passwordTextFormField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      validator: _validatePassword,  
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, size: 20),
        hintText: '********',
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      keyboardType: TextInputType.visiblePassword,
      style: AppTextStyles.body2Regular,
      onEditingComplete: () {
        validate(context); 
      },
    );
  }

  TextFormField emailTextFormField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      validator: _validateEmail,  
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail_outlined, size: 20),
        hintText: 'youremail@mail.com',
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      keyboardType: TextInputType.emailAddress,
      style: AppTextStyles.body2Regular,
      onEditingComplete: () {
        if (_formKey.currentState != null) {
          _formKey.currentState!.validate(); 
        }
        FocusScope.of(context).nextFocus(); 
      },
    );
  }

  void validate(BuildContext context) {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate(); 
    }
    FocusScope.of(context).nextFocus(); 
  }


  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}