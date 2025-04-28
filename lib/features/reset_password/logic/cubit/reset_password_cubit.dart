import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/reset_password_request_model.dart';
import '../../data/repos/reset_password_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _repo;
  ResetPasswordCubit(this._repo) : super(const ResetPasswordState.initial());

  // Form keys
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final otpVerificationFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  // Controllers
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  // OTP Timer
  Timer? _otpTimer;
  int _otpTimeout = 120;
  bool canResendOtp = false;

  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmationController = TextEditingController();

  String getOtpCode() {
    return otpControllers.reversed
        .map((controller) => controller.text.trim())
        .join();
  }

  void startTimer() {
    _otpTimer?.cancel();
    _otpTimeout = 120; // Remember to change this to 120
    canResendOtp = false;
    emit(ResetPasswordState.otpTimerRunning(remainingSeconds: formattedTime()));
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _otpTimeout--;
      // Emit the state To change the value
      emit(ResetPasswordState.otpTimerRunning(
          remainingSeconds: formattedTime()));

      if (_otpTimeout == 0) {
        canResendOtp = true;
        timer.cancel();
      }
    });
  }

  String formattedTime() {
    final minutes = (_otpTimeout ~/ 60).toString().padLeft(2, '0');
    final seconds = (_otpTimeout % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void emitResendOtpState() async {
    final result = await _repo.forgetPassword(emailController.text);
    emit(const ResetPasswordState.otpVerificationLoading());
    result.when(
      success: (message) {
        emit(ResetPasswordState.resendOtpVerificationSuccess(message));
        startTimer();
      },
      failure: (apiErrorModel) =>
          emit(ResetPasswordState.otpVerificationError(apiErrorModel)),
    );
  }

  void emitForgetPasswordStates() async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      emit(const ResetPasswordState.forgetPasswordLoading());
      final result = await _repo.forgetPassword(emailController.text);
      result.when(
          success: (message) {
            emit(ResetPasswordState.forgetPasswordSuccess(message));
            startTimer();
          },
          failure: (apiErrorModel) =>
              emit(ResetPasswordState.forgetPasswordError(apiErrorModel)));
    }
  }

  void emitOtpVerificationStates() async {
    if (otpVerificationFormKey.currentState!.validate()) {
      emit(const ResetPasswordState.otpVerificationLoading());
      final result =
          await _repo.verifyOtp(email: emailController.text, otp: getOtpCode());
      result.when(
        success: (message) {
          emit(ResetPasswordState.otpVerificationSuccess(message));
        },
        failure: (apiErrorModel) =>
            emit(ResetPasswordState.otpVerificationError(apiErrorModel)),
      );
    }
  }

  void emitResetPasswordStates() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      emit(const ResetPasswordState.resetPasswordLoading());
      final result = await _repo.resetPassword(
        ResetPasswordRequestModel(
            email: emailController.text,
            password: newPasswordController.text,
            confirmPassword: newPasswordConfirmationController.text),
      );
      result.when(
        success: (message) =>
            emit(ResetPasswordState.resetPasswordSuccess(message)),
        failure: (apiErrorModel) =>
            emit(ResetPasswordState.resetPasswordError(apiErrorModel)),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    newPasswordController.dispose();
    newPasswordConfirmationController.dispose();
    for (final controller in otpControllers) {
      controller.dispose();
    }
    _otpTimer?.cancel();
    return super.close();
  }
}
