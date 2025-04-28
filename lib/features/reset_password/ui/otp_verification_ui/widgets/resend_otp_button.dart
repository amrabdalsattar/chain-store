part of 'resend_otp_row.dart';

class ResendOtpButton extends StatelessWidget {
  const ResendOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      buildWhen: (previous, current) => current is OtpTimerRunningState,
      builder: (context, state) {
        return MaterialButton(
          onPressed: context.read<ResetPasswordCubit>().canResendOtp
              ? () {
                  context.read<ResetPasswordCubit>().emitResendOtpState();
                }
              : null,
          child: Text(
            'اعادة الإرسال',
            style: AppTextStyles.cairoSemiOpacityBlackRegular16
                .copyWith(fontWeight: FontWeightHelper.medium),
          ),
        );
      },
    );
  }
}
