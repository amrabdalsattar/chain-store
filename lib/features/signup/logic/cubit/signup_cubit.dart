import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/signup_request_model.dart';
import '../../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<String> get businessTypesList => [
        "Clothes",
        "Food",
        "Beverages",
        "Other",
      ];
  String businessType = '';

  void changeBusinessType(String value) {
    businessType = value;
  }

  void emitSignupStates() async {
    if (formKey.currentState!.validate()) {
      emit(const SignupState.loading());
      final result = await _signupRepo.signup(
        SignupRequestModel(
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          email: emailController.text,
          password: passwordController.text,
          address: addressController.text,
          businessType: businessType,
          confirmPassword: confirmPasswordController.text,
          role: 2,
        ),
      );
      result.when(
        success: (confirmationMessage) {
          emit(SignupState.success(confirmationMessage));
        },
        failure: (apiErrorModel) {
          emit(SignupState.error(apiErrorModel));
        },
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    return super.close();
  }
}
