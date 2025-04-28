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
            hintText: 'الإسم',
            controller: signupCubit.nameController,
            validator: (value) {
              if (value == null || value.isEmpty || AppRegex.hasNumber(value)) {
                return 'لا يمكن ان يحتوي علي رموز او ارقام';
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
                return 'من فضلك ادخل بريد الكتروني صحيح';
              }
            },
            prefixIconPath: AppImages.emailIcon,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(24),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            controller: signupCubit.phoneNumberController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'من فضلك ادخل رقم هاتف صحيح';
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
            items: signupCubit.businessTypesList
                .map((value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)))
                .toList(),
            hintText: 'نوع المنتج',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال نوع المنتج';
              }
            },
          ),
          verticalSpace(24),
          CustomTextFormField(
            hintText: 'العنوان',
            controller: signupCubit.addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذه الخانة مطلوبة';
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
              child: isPassObscure
                  ? const Icon(
                      Icons.visibility_off,
                      color: ColorsHelper.darkBlue,
                    )
                  : const Icon(Icons.visibility, color: ColorsHelper.darkBlue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال كلمة مرور صالحة';
              }
              if (value.length < 8) {
                return 'كلمة المرور يجب أن تكون أطول من 8 خانات';
              }
              if (!AppRegex.hasUpperCase(value)) {
                return 'كلمة المرور يجب أن تحتوي على حرف كبير';
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return 'كلمة المرور يجب أن تحتوي على حرف خاص';
              }
              if (!AppRegex.hasNumber(value)) {
                return 'كلمة المرور يجب أن تحتوي على رقم';
              }
              if (!AppRegex.hasLowerCase(value)) {
                return 'كلمة المرور يجب أن تحتوي على حرف صغير';
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
              overlayColor:
                  const WidgetStatePropertyAll(ColorsHelper.transparent),
              onTap: () {
                setState(() {
                  isRepassObscure = !isRepassObscure;
                });
              },
              child: isRepassObscure
                  ? const Icon(
                      Icons.visibility_off,
                      color: ColorsHelper.darkBlue,
                    )
                  : const Icon(Icons.visibility, color: ColorsHelper.darkBlue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى تأكيد كلمة المرور';
              }
              if (value !=
                  context.read<SignupCubit>().passwordController.text) {
                return 'كلمات المرور غير متوافقة، حاول مرة أخرى.';
              }
            },
          ),
        ],
      ),
    );
  }
}
