part of '../reset_password_screen.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool isPassObscure = true;
  bool isRepassObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().resetPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Textfield
          Text(
            ConstantString.password,
            // style: AppTextStyles.cairoDarkGrayBold16,
          ),
          verticalSpace(8),
          CustomTextFormField(
            controller:
                context.read<ResetPasswordCubit>().newPasswordController,
            hintText: 'Enter password',
            prefixIconPath: AppImages.lockIcon,
            isObscure: isPassObscure,
            suffixIcon: InkWell(
              overlayColor: const WidgetStatePropertyAll(
                ColorsHelper.transparent,
              ),
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
          // Second Textfield
          Text(
            ConstantString.password,
            // style: AppTextStyles.cairoDarkGrayBold16,
          ),
          verticalSpace(8),
          CustomTextFormField(
            controller:
                context
                    .read<ResetPasswordCubit>()
                    .newPasswordConfirmationController,
            hintText: 'أعد إدخال كلمة المرور',
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
                return 'يرجى تأكيد كلمة المرور';
              }
              if (value !=
                  context
                      .read<ResetPasswordCubit>()
                      .newPasswordController
                      .text) {
                return 'كلمات المرور غير متوافقة، حاول مرة أخرى.';
              }
            },
          ),
        ],
      ),
    );
  }
}
