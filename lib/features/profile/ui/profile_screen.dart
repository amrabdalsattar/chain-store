import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/basic_app_bar.dart';
import 'widgets/save_button.dart';
import 'widgets/user_data_form.dart';
import 'widgets/user_data_text_field.dart';
import 'widgets/user_profile_image_bloc_consumer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.backgroundScaffoldColor,
      appBar: const BasicAppBar(
        title: 'My Profile',
        backgroundColor: ColorsHelper.backgroundScaffoldColor,
        actionWidget: SaveButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileImageBlocConsumer(),
            verticalSpace(8),
            const ProfileSection(
              title: 'Account Information',
              widgets: [
                UserDataTextField(labelText: 'Full Name'),
                UserDataTextField(labelText: 'Email'),
                UserDataTextField(labelText: 'Phone Number'),
              ],
            ),
            const ProfileSection(
              title: 'Addresses',
              widgets: [
                UserDataTextField(labeled: false),
                UserDataTextField(labeled: false),
              ],
            ),
            const ProfileSection(
              title: 'Business Information',
              widgets: [
                UserDataTextField(labelText: 'Business Type'),
                UserDataTextField(labelText: 'Business Name'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
