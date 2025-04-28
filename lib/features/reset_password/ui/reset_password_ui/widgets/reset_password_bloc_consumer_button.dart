import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/dialogs_helper.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../logic/cubit/reset_password_cubit.dart';
import '../../../logic/cubit/reset_password_state.dart';

class ResetPasswordBlocConsumerButton extends StatelessWidget {
  const ResetPasswordBlocConsumerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen:
          (previous, current) =>
              current is ResetPasswordLoadingState ||
              current is ResetPasswordErrorState ||
              current is ResetPasswordSuccessState,
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordError:
              (apiErrorModel) => DialogsHelper.showErrorDialog(
                context,
                apiErrorModel.getErrorMessages()!,
              ),
          resetPasswordSuccess: (message) {
            DialogsHelper.showSnackBar(context, message);
            context.pushNamedAndRemoveUntil(
              Routes.loginRoute,
              predicate: (route) => false,
            );
          },
        );
      },
      builder:
          (context, state) => CustomButton(
            title: 'Save password',
            width: double.infinity,
            isLoading: state is ResetPasswordLoadingState,
            onTap: () {
              context.read<ResetPasswordCubit>().emitResetPasswordStates();
            },
          ),
    );
  }
}
