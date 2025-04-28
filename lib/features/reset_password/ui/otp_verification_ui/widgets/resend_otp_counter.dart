part of 'resend_otp_row.dart';

class ResendOtpCounter extends StatelessWidget {
  const ResendOtpCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ResetPasswordCubit, ResetPasswordState, String?>(
      selector: (state) {
        return state.maybeMap(
          otpTimerRunning: (state) => state.remainingSeconds,
          orElse: () => '00:00',
        );
      },
      builder: (context, remainingSeconds) {
        return Text(
          'إعادة الإرسال خلال $remainingSeconds',
          // style: AppTextStyles.cairoSemiGreyRegular12.copyWith(fontSize: 12),
        );
      },
    );
  }
}
