part of 'order_time_line.dart';

class StepLabel extends StatelessWidget {
  final String label;
  final bool isStepped;
  const StepLabel({super.key, required this.label, required this.isStepped});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: AppTextStyles.robotoGrayRegular10.copyWith(
        color: isStepped ? ColorsHelper.primaryColor : ColorsHelper.gray,
      ),
    );
  }
}
