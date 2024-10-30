import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_state.dart';
import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/screens/home_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupAccountScreen extends StatelessWidget {
  final String email;
  final String password;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SetupAccountScreen({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenBloc>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_rounded),
          title: _buildAppname(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildDescrition(),
              _buildAvatarProfile(),
              _buildInformationForm(context),
              _buildSubmitButton(authBloc),
              // BlocConsumer to test 
              BlocConsumer<AuthenBloc, AuthenState>(
                listener: (context, state) {
                    if (state is AuthenSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                      ),
                    );
                    } else if (state is AuthenFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text('Authentication Failed: ${state.error}'),
                      backgroundColor: Colors.red,
                      ),
                    );
                    }
                  
                },
                builder: (context, state) {
                  if (state is AuthenLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppname() {
    return const Row(
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text('Setup your account', style: AppTextStyles.heading2Semibold),
        const SizedBox(height: 10),
        Text(
          'Setup your account first before you can borrow lots of interesting books!', 
          style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildAvatarProfile() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.themeSecondary,
            child:Icon(Icons.person_outline, size: 50, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 10),
          Text('Change photo profile', style: AppTextStyles.title2Semibold.copyWith(color: AppColors.primary),)
        ],
      ),
    );
  }

  Widget _buildInformationForm(BuildContext context) {
    return Form(
      key: _formKey,  // Attach the GlobalKey to the Form
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Full name', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          fullnameTextFormField(context),
          const SizedBox(height: 20),
          const Text('Gender', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          genderDropdown(),
          const SizedBox(height: 20),
          const Text('Date of birth', style: AppTextStyles.body2Semibold),
          const SizedBox(height: 10),
          birthDateTextFormField(context),
          //_buildSubmitButton()
        ],
      ),
    );
  }

  Row _buildSubmitButton(AuthenBloc authBloc) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            statesController: WidgetStatesController(_formKey.currentState != null ? {WidgetState.selected} : {WidgetState.disabled}),
            onPressed: () {
              SignUpRequest signUpRequest = SignUpRequest(
                email: email,
                password: password,
                username: _fullnameController.text
              );
              authBloc.add(SignUpEvent(signUpRequest));
            },
            child: const Text('Submit', 
              style: AppTextStyles.body2Semibold
            )
          )
        ),
      ],
    );
  }

  Widget genderDropdown() {
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.arrow_drop_down_rounded),
      dropdownColor: AppColors.themeSecondary,
      decoration: InputDecoration(
        hintText: 'Select your gender',
        hintStyle: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary),
      ),
      items: ['Male', 'Female', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: AppTextStyles.body2Regular),
        );
      }).toList(),
      onChanged: (String? newValue) {
        _genderController.text = newValue!;
      },
    );
  }

  TextFormField fullnameTextFormField(BuildContext context) {
    return TextFormField(
      controller: _fullnameController,
      decoration: const InputDecoration(
        hintText: 'Eg. John Doe',
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      keyboardType: TextInputType.emailAddress,
      style: AppTextStyles.body2Regular,
    );
  }

  //
  Widget birthDateTextFormField(BuildContext context) {
    return TextFormField(
      controller: _birthDateController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.calendar_today, size: 20),
        hintText: 'Select your birth date',
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          _birthDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
        }
      },
      style: AppTextStyles.body2Regular,
    );
  }

  
}