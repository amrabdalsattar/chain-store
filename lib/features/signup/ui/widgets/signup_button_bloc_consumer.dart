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
      listenWhen: (previous, current) =>
          current is SignupLoadingState ||
          current is SignupSuccessState ||
          current is SignupErrorState,
      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) => DialogsHelper.showToastificationMessage(
            alignment: Alignment.topCenter,
            context: context,
            title: 'خطأ',
            description: apiErrorModel.getErrorMessages()!,
            type: ToastificationType.error,
          ),
          success: (confirmationMessage) {
            Navigator.of(context).pop();
            DialogsHelper.showToastificationMessage(
              alignment: Alignment.bottomCenter,
              context: context,
              title: 'تمت العملية بنجاح',
              description: "تم ارسال رابط التأكيد الى بريدك الإلكتروني",
              type: ToastificationType.success,
            );
          },
        );
      },
      builder: (context, state) => CustomButton(
        title: 'سجل الآن',
        width: double.infinity,
        onTap: () => context.read<SignupCubit>().emitSignupStates(),
        isLoading: state is SignupLoadingState,
      ),
    );
  }
}
