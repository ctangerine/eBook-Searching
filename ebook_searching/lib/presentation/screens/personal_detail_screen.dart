import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details', style: AppTextStyles.heading3Semibold),
        centerTitle: true,
        actions: [
          _buildEditButton(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildAvatarProfile(),
            _personalDetail(),
          ],
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
          backgroundImage: NetworkImage(widget.avatarUrl),
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
          initialValue: widget.fullname,
          readOnly: !isEdit,
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
            // Handle change here
          } : null,
          value: widget.gender ? 'Male' : 'Female', // Assuming gender is a boolean where true is Male and false is Female
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
          initialValue: widget.dob.toString(),
          readOnly: !isEdit,
        ),
      ],
    );
  }
}