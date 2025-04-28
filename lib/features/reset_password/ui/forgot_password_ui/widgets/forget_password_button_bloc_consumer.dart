import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/dialogs_helper.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../logic/cubit/reset_password_cubit.dart';
import '../../../logic/cubit/reset_password_state.dart';

class ForgetPasswordButtonBlocConsumer extends StatelessWidget {
  const ForgetPasswordButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen:
          (previous, current) =>
              current is ForgetPasswordLoadingState ||
              current is ForgetPasswordSuccessState ||
              current is ForgetPasswordErrorState,
      listener: (context, state) {
        state.whenOrNull(
          forgetPasswordError:
              (apiErrorModel) => DialogsHelper.showErrorDialog(
                context,
                apiErrorModel.getErrorMessages()!,
              ),
          forgetPasswordSuccess: (successMessage) {
            DialogsHelper.showSnackBar(context, successMessage);

            context.pushNamed(
              Routes.otpScreenRoute,
              arguments: context.read<ResetPasswordCubit>(),
            );
          },
        );
      },
      builder:
          (context, state) => CustomButton(
            title: 'Send OTP',
            width: double.infinity,
            isLoading: state is ForgetPasswordLoadingState,
            onTap: () {
              context.read<ResetPasswordCubit>().emitForgetPasswordStates();
            },
          ),
    );
  }
}
