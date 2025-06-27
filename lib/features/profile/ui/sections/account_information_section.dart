part of '../widgets/profile_content.dart';

class AccountInformationSection extends StatelessWidget {
  const AccountInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return ProfileSection(
      title: 'Account Information',
      widgets: [
        UserDataTextField(
          labelText: 'Full Name',
          controller: profileCubit.nameController,
        ),
        UserDataTextField(
          labelText: 'Email',
          controller: profileCubit.emailController,
          enabled: false,
        ),
        UserDataTextField(
          labelText: 'Phone Number',
          controller: profileCubit.phoneNumberController,
        ),
      ],
    );
  }
}
