part of '../ratings_reviews_screen.dart';

class RatingSummaryContainer extends StatelessWidget {
  final Widget header;
  final Widget ratingDisplay;
  final Widget writeReviewButton;

  const RatingSummaryContainer({
    super.key,
    required this.header,
    required this.ratingDisplay,
    required this.writeReviewButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const SizedBox(height: 20),
          ratingDisplay,
          const SizedBox(height: 24),
          writeReviewButton,
        ],
      ),
    );
  }
}