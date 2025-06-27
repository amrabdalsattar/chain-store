import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../logic/cubit/profile_cubit.dart';

import 'user_data_form.dart';
import 'user_data_text_field.dart';
import 'user_profile_image_bloc_consumer.dart';
part '../sections/account_information_section.dart';
part '../sections/addresses_section.dart';
part '../sections/business_information_section.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserProfileImageBlocConsumer(),
          verticalSpace(8),
          const AccountInformationSection(),
          const UserAddressesSection(),
          const BusinessInformationSection(),
        ],
      ),
    );
  }
}
