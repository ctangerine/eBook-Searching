import 'package:ebook_searching/app_routes.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_state.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_event.dart';
import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenBloc>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAppname(),
                    _buildDescrition(),
                    _buildLoginForm(context, authBloc),
                    _buildTermPart(),
                  ],
                ),
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Read our ', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary)),
            TextButton(
              onPressed: () {},
              child: Text('Privacy Policy', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppname() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BookTudIcon(),
        Text('BookTud', style: AppTextStyles.heading2Semibold),
      ],
    );
  }

  Widget _buildDescrition() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Welcome back!', style: AppTextStyles.heading2Semibold),
        const SizedBox(height: 10),
        Text('You can log into your account first to read many interesting books!', style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context, AuthenBloc authBloc) {
    return Form(
      key: _formKey, // Attach the GlobalKey to the Form
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
          _buildLoginButton(authBloc),
          const SizedBox(height: 10),
          _buildLoginWithGoogleButton(),
          const SizedBox(height: 10),
          _buildBlocConsumer(),
        ],
      ),
    );
  }

  BlocConsumer<AuthenBloc, AuthenState> _buildBlocConsumer() {
    return BlocConsumer<AuthenBloc, AuthenState>(
      listener: (context, state) {
        if (state is AuthenSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful')),
          );
          final userBloc = BlocProvider.of<UserBloc>(context);
          userBloc.add(GetProfileEvent(102210131));
          Navigator.of(context).pushNamed(AppRoutes.homePage);
        } else if (state is AuthenFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Failed with error: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(); // Return an empty container or any other widget
        }
      },
    );
  }


  Row _buildLoginWithGoogleButton() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => {},
            child: const Text('Login with Google', style: AppTextStyles.body2Semibold),
          ),
        ),
      ],
    );
  }

  Row _buildLoginButton(AuthenBloc authBloc) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            statesController: WidgetStatesController(_formKey.currentState != null ? {WidgetState.selected} : {WidgetState.disabled}),
            onPressed: () {
              if (_formKey.currentState != null) {
                if (_formKey.currentState!.validate()) {
                  SignInRequest signInRequest = SignInRequest(
                    username: _emailController.text,
                    password: _passwordController.text,
                  );
                  authBloc.add(SignInEvent(signInRequest));
                }
              }
            },
            child: const Text('Login', style: AppTextStyles.body2Semibold),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Forgot your password?', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary)),
        TextButton(
          onPressed: () {},
          child: Text('Reset here', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary)),
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