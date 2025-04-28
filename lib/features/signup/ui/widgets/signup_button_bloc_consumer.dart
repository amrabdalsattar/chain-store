import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/signup_cubit.dart';
import '../../logic/cubit/signup_state.dart';

class SignupButtonBlocConsumer extends StatelessWidget {
  const SignupButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      bloc: context.read<SignupCubit>(),
      listenWhen:
          (previous, current) =>
              current is SignupLoadingState ||
              current is SignupSuccessState ||
              current is SignupErrorState,
      listener: (context, state) {
        state.whenOrNull(
          error:
              (apiErrorModel) => DialogsHelper.showToastificationMessage(
                alignment: Alignment.topCenter,
                context: context,
                title: 'Error',
                description: apiErrorModel.getErrorMessages()!,
                type: ToastificationType.error,
              ),
          success: (confirmationMessage) {
            Navigator.of(context).pop();
            DialogsHelper.showToastificationMessage(
              alignment: Alignment.bottomCenter,
              context: context,
              title: 'The operation was successful.',
              description: "A confirmation link has been sent to your email.",
              type: ToastificationType.success,
            );
          },
        );
      },
      builder:
          (context, state) => CustomButton(
            title: 'Sign up',
            width: double.infinity,
            onTap: () => context.read<SignupCubit>().emitSignupStates(),
            isLoading: state is SignupLoadingState,
          ),
    );
  }
}
