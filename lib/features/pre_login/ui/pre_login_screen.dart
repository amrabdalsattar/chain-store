import '../../../core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../core/helpers/dialogs_helper.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_loading_indicator.dart';
import '../logic/cubit/pre_login_cubit.dart';
import '../logic/cubit/pre_login_state.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreLoginCubit, PreLoginState>(
      listenWhen:
          (previous, current) =>
              current is PreLoginErrorState || current is PreLoginSuccessState,
      listener: (context, state) {
        switch (state) {
          case PreLoginErrorState():
            context.pop();
            DialogsHelper.showToastificationMessage(
              context: context,
              title: 'Error',
              description: state.apiErrorModel.getErrorMessages()!,
              type: ToastificationType.error,
              alignment: Alignment.bottomCenter,
            );
          case PreLoginSuccessState():
            context.pushNamedAndRemoveUntil(
              Routes.mainScreenRoute,
              predicate: (route) => false,
            );
          default:
        }
      },
      child: const Scaffold(body: Center(child: CustomLoadingIndicator())),
    );
  }
}
