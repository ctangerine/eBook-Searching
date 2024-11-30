import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/screens/setup_account_screen.dart';
import 'package:ebook_searching/presentation/screens/signin_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _buildAppname(),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -100,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDescrition(),
                  _buildSignupForm(context),
                  _buildTermPart()
                ],
              ),
            ),
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
      //mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
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
        const SizedBox(height: 20),
        const Text('Create your account', style: AppTextStyles.heading2Semibold),
        const SizedBox(height: 10),
        SizedBox(
          width: 340,
          child: Text('Create a new account so you can read lots of interesting books!', 
          style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary, height: 1.5), 
          textAlign: TextAlign.center,),
          
        )
      ],
    );
  }

  Widget _buildSignupForm(BuildContext context) {
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
          const Text('Confirm Password', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          confirmPasswordTextFormField(context),
          const SizedBox(height: 30),
          _buildRegisterButton(context),
          const SizedBox(height: 10),
          _buildLoginWithGoogleButton(context)
        ],
      ),
    );
  }

  Row _buildLoginWithGoogleButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SigninScreen(),)
              )
            }, 
            child: const Text('Account already? Sign In', 
              style: AppTextStyles.body2Semibold
            )
          ) ,
        )
      ],
    );
  }

  Row _buildRegisterButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            statesController: WidgetStatesController(
              _formKey.currentState != null ? {WidgetState.selected} : {WidgetState.disabled},
            ),
            onPressed: () {
              Future.delayed(const Duration(seconds: 2));
              _onRegisterButtonPressed(context);
            }, 
            child: const Text(
              'Register',
              style: AppTextStyles.body2Semibold,
            ),
          ),
        ),
      ],
    );
  }

  void _onRegisterButtonPressed(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SetupAccountScreen(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
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

  TextFormField confirmPasswordTextFormField(BuildContext context) {
    return TextFormField(
      controller: _confirmPasswordController,
      validator: _validateConfirmPassword,  
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value != _passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }
}