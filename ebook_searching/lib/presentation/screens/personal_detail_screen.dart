import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_state.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailScreen extends StatefulWidget {
  final String fullname;
  final String avatarUrl;
  final bool gender;
  final DateTime dob;

  const PersonalDetailScreen({
    super.key,
    required this.fullname,
    required this.avatarUrl,
    required this.gender,
    required this.dob,
  });

  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  bool isEdit = false;
  late TextEditingController _fullnameController;
  late TextEditingController _dobController;
  late TextEditingController _genderController;
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController(text: widget.fullname);
    _dobController = TextEditingController(text: widget.dob.toString());
    _genderController = TextEditingController(text: widget.gender ? 'Male' : 'Female');
    _userBloc = context.read<UserBloc>();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details', style: AppTextStyles.title1Semibold),
        centerTitle: true,
        actions: [
          _buildEditButton(),
        ],
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Update profile success'),
                backgroundColor: AppColors.primary,
              ),
            );
          } else if (state is UpdateProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Update profile failure'),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildAvatarProfile(),
              _personalDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Row(
      children: [
        FilledButton(
          onPressed: () {
            setState(() {
              isEdit = !isEdit;
            });
            if (!isEdit) {
              final request = UpdateProfileRequest(
                fullName: _fullnameController.text,
                gender: _genderController.text,
                dateOfBirth: _dobController.text,
              );
              _userBloc.add(UpdateProfileEvent(request));
            }
          },
          child: Text(isEdit ? 'Save' : 'Edit'),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildAvatarProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(widget.avatarUrl),
        ),
      ],
    );
  }

  Widget _personalDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Full name', style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          readOnly: !isEdit,
          controller: _fullnameController,
        ),
        const SizedBox(height: 20),
        const Text('Gender', style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          items: ['Male', 'Female', 'Other'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: AppTextStyles.body2Regular),
            );
          }).toList(),
          onChanged: isEdit ? (String? newValue) {
            setState(() {
              _genderController.text = newValue!;
            });
          } : null,
          value: _genderController.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabled: isEdit,
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textSecondary),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Date of birth', style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          readOnly: !isEdit,
          controller: _dobController,
        ),
      ],
    );
  }
}