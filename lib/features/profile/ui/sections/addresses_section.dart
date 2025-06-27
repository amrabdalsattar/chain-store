part of '../widgets/profile_content.dart';

class UserAddressesSection extends StatelessWidget {
  const UserAddressesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return ProfileSection(
      title: 'Addresses',
      widgets: [
        UserDataTextField(
          labeled: false,
          controller: profileCubit.addressController,
        ),
        verticalSpace(8),
        Row(
          children: [
            Icon(Icons.add, color: ColorsHelper.primaryColor, size: 16.r),
            horizontalSpace(8),
            Text('Add new address', style: AppTextStyles.rubikPrimaryRegular12),
          ],
        ),
      ],
    );
  }
}
