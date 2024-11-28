import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_state.dart';
import 'package:ebook_searching/presentation/common_widgets/custom_popup.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

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
    _userBloc = context.read<UserBloc>();
    _initializeControllers();
  }

  void _initializeControllers() {
    final user = (_userBloc.state is GetProfileSuccess) 
      ? (_userBloc.state as GetProfileSuccess).response 
      : null;

    _fullnameController = TextEditingController(text: user?.fullName ?? '');
    _dobController = TextEditingController(text: user?.dateOfBirth ?? '');
    _genderController = TextEditingController();
    _genderController.text = _userBloc.state is GetProfileSuccess ? (_userBloc.state as GetProfileSuccess).response.gender ?? '' : '';
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
        actions: [_buildEditButton(), const SizedBox(width: 10)],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: _handleProfileUpdate,
        builder: (context, state) => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarProfile(),
              _buildPersonalDetail(state),
            ],
          ),
        ),
      ),
    );
  }

  void _handleProfileUpdate(BuildContext context, UserState state) {
    if (state is GetProfileSuccess && state.message != null) {
      _fullnameController.text = state.response.fullName ?? '';
      _dobController.text = state.response.dateOfBirth ?? '';
      _genderController.text = state.response.gender ?? '';

      showDialog(
        context: context,
        builder: (context) => CustomPopup(
          title: 'Update profile',
          confirmText: 'OK',
          content: 'Update failed with error message: ${state.message}',
          onConfirm: () => Navigator.of(context).pop(),
          onCancel: () => Navigator.of(context).pop(),
        ),
      );
    }
  }

  Widget _buildEditButton() {
    return FilledButton(
      onPressed: () {
        setState(() => isEdit = !isEdit);
        if (!isEdit) {
          final request = UpdateProfileRequest(
            fullName: _fullnameController.text,
            gender: _genderController.text,
            dateOfBirth: _dobController.text,
            userId: _userBloc.state is GetProfileSuccess ? (_userBloc.state as GetProfileSuccess).response.userId : _userBloc.state is UpdateProfileSuccess ? (_userBloc.state as UpdateProfileSuccess).response.userId : 0,
          );
          _userBloc.add(UpdateProfileEvent(request));
        }
      },
      child: Text(isEdit ? 'Save' : 'Edit'),
    );
  }

  Widget _buildAvatarProfile() {
    return const Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(avatar),
      ),
    );
  }

  Widget _buildPersonalDetail(UserState state) {
    if (state is UpdateProfileFailure && state.orgUser == null) {
      return const Center(
        child: Text(
          'No user data available',
          style: AppTextStyles.body2Medium,
        ),
      );
    }
    return _buildUserFields();
  }

  Widget _buildUserFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField('Full name', _fullnameController, isReadOnly: !isEdit),
        const SizedBox(height: 20),
        _buildGenderField(),
        const SizedBox(height: 20),
        _buildField('Date of birth', _dobController, isDate: true),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isReadOnly = false, bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          readOnly: isReadOnly,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onTap: isDate && isEdit ? _pickDate : null,
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = pickedDate.toString().split(' ')[0];
      });
    }
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        isEdit
          ? DropdownButtonFormField<String>(
              items: ['male', 'female', 'other'].map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: AppTextStyles.body2Regular),
                );
              }).toList(),
              onChanged: (value) => setState(() => _genderController.text = value ?? ''),
              value: _genderController.text.isNotEmpty ? _genderController.text : null,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            )
          : TextFormField(
              controller: _genderController,
              readOnly: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
      ],
    );
  }
}
