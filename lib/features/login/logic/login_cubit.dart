import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/cache/user_data_operator.dart';
import '../../../core/helpers/token_helper.dart';
import '../data/models/login_response_model.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());

    final result = await _loginRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    result.when(
      success: (loginResponseModel) async {
        await _handleLoginSuccess(loginResponseModel);
        emit(LoginState.success(loginResponseModel));
      },
      failure: (error) => emit(LoginState.error(error)),
    );
  }

  Future<void> _handleLoginSuccess(LoginResponseModel response) async {
    if (response.userData != null) {
      await UserDataOperator.saveUserData(response.userData!);
      await TokenHelper.setSecuredUserToken(response.userData!.token);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
