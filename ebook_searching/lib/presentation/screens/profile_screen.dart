import 'package:ebook_searching/presentation/blocs/bloc_user/user_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_state.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/functional_tag.dart';
import 'package:ebook_searching/presentation/screens/personal_detail_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: AppTextStyles.heading3Semibold,),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarProfile(context),
              const SizedBox(height: 30),
              _buildAccountTab(context),
              const SizedBox(height: 20),
              _buildGeneralTab(context),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildAvatarProfile(BuildContext context) {
    final user = (context.read<UserBloc>().state as GetProfileSuccess).response;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(avatar),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.fullName?? '', style: AppTextStyles.body2Semibold,),
            const SizedBox(height: 10),
            Text('Senior High School, Grade XII', style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),),
          ],
        )
      ],
    );
  }

  Widget _buildAccountTab(BuildContext context) {
    final user = (context.read<UserBloc>().state as GetProfileSuccess).response;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Account', style: AppTextStyles.title2Semibold,),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            const List<String> functionalList = ['Personal details', 'Membership', 'Notifications', 'Account settings', 'Language'];
            const List<IconData> funtionalIcon = [Icons.person_outline, Icons.card_membership_outlined, Icons.notifications_outlined, Icons.settings_outlined, Icons.language_outlined];
            return InkWell(
              onTap: index != 0 ? () {} : () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => PersonalDetailScreen(
                      fullname: user.fullName ?? user.username ?? user.email,
                      avatarUrl: avatar,
                      gender: user.gender == 'Nam'? true : false,
                      dob: user.dateOfBirth != null ? DateTime.parse(user.dateOfBirth!) : DateTime.now(),
                      
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: FunctionalTag(
                  leadingIcon: funtionalIcon[index],
                  label: functionalList[index],
                ),
              ),
            );
              
          },
        )
      ],
    );
  }

  Widget _buildGeneralTab(BuildContext context) {
    final user = (context.read<UserBloc>().state as GetProfileSuccess).response;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('General', style: AppTextStyles.title2Semibold,),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            const List<String> functionalList = ['FAQs & Help', 'Policies & Terms', 'Give app rating'];
            const List<IconData> funtionalIcon = [Icons.help_outline, Icons.assignment_outlined, Icons.star_outline];
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: FunctionalTag(
                  leadingIcon: funtionalIcon[index],
                  label: functionalList[index],
                  onTap: index != 0 ? null : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalDetailScreen(
                          fullname: user.fullName ?? user.username ?? user.email,
                          avatarUrl: avatar,
                          gender: user.gender == 'Nam'? true : false,
                          dob: user.dateOfBirth != null ? DateTime.parse(user.dateOfBirth!) : DateTime.now(),
                        ),
                      )
                    );
                  }               
                ),
              ),
            );
        
          },
        )
      ],
    );
  }

}