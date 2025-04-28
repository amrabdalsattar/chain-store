import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/dialogs_helper.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../logic/cubit/reset_password_cubit.dart';
import '../../../logic/cubit/reset_password_state.dart';

class OtpButtonBlocConsumer extends StatelessWidget {
  const OtpButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen:
          (previous, current) =>
              current is ResendOtpVerficationSuccess ||
              current is OtpVerificationLoadingState ||
              current is OtpVerificationSuccessState ||
              current is OtpVerificationErrorState,
      listener: (context, state) {
        state.whenOrNull(
          resendOtpVerificationSuccess:
              (message) => DialogsHelper.showSnackBar(context, message),
          otpVerificationError:
              (apiErrorModel) => DialogsHelper.showErrorDialog(
                context,
                apiErrorModel.getErrorMessages()!,
              ),
          otpVerificationSuccess: (message) {
            DialogsHelper.showSnackBar(context, message);
            context.pushNamed(
              Routes.resetPasswordScreenRoute,
              arguments: context.read<ResetPasswordCubit>(),
            );
          },
        );
      },
      builder:
          (context, state) => CustomButton(
            title: 'Verify',
            width: double.infinity,
            isLoading: state is OtpVerificationLoadingState,
            onTap: () {
              context.read<ResetPasswordCubit>().emitOtpVerificationStates();
            },
          ),
    );
  }
}
