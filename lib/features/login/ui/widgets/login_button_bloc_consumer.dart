import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/dialogs_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: context.read<LoginCubit>(),
      listenWhen: (previous, current) =>
          current is LoginErrorState ||
          current is LoginSuccessState ||
          current is LoginLoadingState,
      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) => DialogsHelper.showErrorDialog(
              context, apiErrorModel.getErrorMessages()!),
          success: (loginResponseModel) =>
              context.pushNamed(Routes.preLoginScreenRoute),
        );
      },
      builder: (context, state) => CustomButton(
        title: 'تسجيل الدخول',
        width: double.infinity,
        isLoading: state is LoginLoadingState,
        onTap: () {
          context.read<LoginCubit>().emitLoginStates();
        },
      ),
    );
  }
}
