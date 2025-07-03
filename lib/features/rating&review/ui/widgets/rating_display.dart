part of '../ratings_reviews_screen.dart';


class RatingDisplay extends StatelessWidget {
  final double averageRating;
  final int totalReviews;

  const RatingDisplay({
    super.key,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: RatingDetails(
            averageRating: averageRating,
            totalReviews: totalReviews,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: RatingBars(totalReviews: totalReviews),
        ),
      ],
    );
  }
}