part of '../widgets/profile_content.dart';

class BusinessInformationSection extends StatelessWidget {
  const BusinessInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return ProfileSection(
      title: 'Business Information',
      widgets: [
        UserDataTextField(
          labelText: 'Business Type',
          controller: profileCubit.businessTypeController,
        ),
        UserDataTextField(
          labelText: 'Business Name',
          controller: profileCubit.businessNameController,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
