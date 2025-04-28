import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/constant_string.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignupForm> {
  bool isPassObscure = true;
  bool isRepassObscure = true;

  late final SignupCubit signupCubit;

  @override
  void initState() {
    signupCubit = context.read<SignupCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupCubit.formKey,
      child: Column(
        children: [
          verticalSpace(24),
          CustomTextFormField(
            hintText: 'Name',
            controller: signupCubit.nameController,
            validator: (value) {
              if (value == null || value.isEmpty || AppRegex.hasNumber(value)) {
                return 'It cannot contain symbols or numbers';
              }
            },
            prefixIconPath: AppImages.personIcon,
            keyboardType: TextInputType.name,
          ),
          verticalSpace(24),
          CustomTextFormField(
            hintText: ConstantString.email,
            controller: signupCubit.emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
            },
            prefixIconPath: AppImages.emailIcon,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(24),
          CustomTextFormField(
            hintText: 'Phone Number',
            controller: signupCubit.phoneNumberController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            prefixIconPath: AppImages.phoneIcon,
            keyboardType: TextInputType.phone,
          ),
          verticalSpace(24),
          CustomDropdownButton(
            onChanged: (value) {
              signupCubit.changeBusinessType(value ?? '');
            },
            value: null,
            items:
                signupCubit.businessTypesList
                    .map(
                      (value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
            hintText: "Product's Type",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the product's type";
              }
            },
          ),
          verticalSpace(24),
          CustomTextFormField(
            hintText: 'Address',
            controller: signupCubit.addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
            },
            prefixIconPath: AppImages.addressIcon,
          ),
          verticalSpace(24),
          CustomTextFormField(
            controller: signupCubit.passwordController,
            hintText: ConstantString.password,
            prefixIconPath: AppImages.lockIcon,
            isObscure: isPassObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPassObscure = !isPassObscure;
                });
              },
              child:
                  isPassObscure
                      ? const Icon(
                        Icons.visibility_off,
                        color: ColorsHelper.darkBlue,
                      )
                      : const Icon(
                        Icons.visibility,
                        color: ColorsHelper.darkBlue,
                      ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password.';
              }
              if (value.length < 8) {
                return 'The password must be longer than 8 characters.';
              }
              if (!AppRegex.hasUpperCase(value)) {
                return 'The password must contain at least one uppercase letter.';
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return 'The password must contain a special character.';
              }
              if (!AppRegex.hasNumber(value)) {
                return 'The password must contain a number.';
              }
              if (!AppRegex.hasLowerCase(value)) {
                return 'The password must contain a lowercase letter.';
              }
            },
          ),
          verticalSpace(24),
          CustomTextFormField(
            controller: signupCubit.confirmPasswordController,
            hintText: ConstantString.confirmPassword,
            prefixIconPath: AppImages.lockIcon,
            isObscure: isRepassObscure,
            suffixIcon: InkWell(
              overlayColor: const WidgetStatePropertyAll(
                ColorsHelper.transparent,
              ),
              onTap: () {
                setState(() {
                  isRepassObscure = !isRepassObscure;
                });
              },
              child:
                  isRepassObscure
                      ? const Icon(
                        Icons.visibility_off,
                        color: ColorsHelper.darkBlue,
                      )
                      : const Icon(
                        Icons.visibility,
                        color: ColorsHelper.darkBlue,
                      ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value !=
                  context.read<SignupCubit>().passwordController.text) {
                return 'Passwords do not match, please try again.';
              }
            },
          ),
        ],
      ),
    );
  }
}
