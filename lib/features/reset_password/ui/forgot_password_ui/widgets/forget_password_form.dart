import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/constant_string.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../logic/cubit/reset_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().forgetPasswordFormKey,
      child: CustomTextFormField(
        hintText: ConstantString.email,
        keyboardType: TextInputType.emailAddress,
        controller: context.read<ResetPasswordCubit>().emailController,
        validator: (value) {
          if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
            return 'Please Enter a valid Email';
          }
        },
        prefixIconPath: AppImages.emailIcon,
      ),
    );
  }
}
