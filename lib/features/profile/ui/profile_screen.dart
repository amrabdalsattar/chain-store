import 'package:flutter/material.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/basic_app_bar.dart';
import 'widgets/profile_bloc_consumer.dart';
import 'widgets/save_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsHelper.backgroundScaffoldColor,
      appBar: BasicAppBar(
        title: 'My Profile',
        backgroundColor: ColorsHelper.backgroundScaffoldColor,
        actionWidget: SaveButton(),
      ),
      body: ProfileBlocConsumer(),
    );
  }
}
