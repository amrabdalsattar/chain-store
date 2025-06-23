part of 'order_time_line.dart';

class TimelineStep extends StatelessWidget {
  final int index;
  final int currentStep;
  final List<String> steps;
  const TimelineStep({
    super.key,
    required this.index,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = index <= currentStep;
    final isLast = index == steps.length - 1;
    return Row(
      children: [
        // Step circle
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: CircleAvatar(
            radius: 8,
            backgroundColor:
                isCompleted
                    ? ColorsHelper.primaryColor
                    : ColorsHelper.fadedGray,
          ),
        ),
        // Line
        if (!isLast)
          Container(
            height: 1,
            width: 80.w,
            color:
                index < currentStep
                    ? ColorsHelper.primaryColor
                    : ColorsHelper.fadedGray,
          ),
      ],
    );
  }
}
