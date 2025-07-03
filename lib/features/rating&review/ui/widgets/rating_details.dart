part of '../ratings_reviews_screen.dart';

class RatingDetails extends StatelessWidget {
  final double averageRating;
  final int totalReviews;

  const RatingDetails({
    super.key,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              averageRating.toStringAsFixed(1),
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontSize: 56,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                height: 1.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12, left: 6),
              child: Text(
                '/5',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Replace with your RatingStars widget if available
        // RatingStars(rating: averageRating, size: 16, showEmptyStars: true),
        const SizedBox(height: 6),
        Text(
          _getReviewText(),
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  String _getReviewText() {
    if (totalReviews == 0) return 'No reviews yet';
    if (totalReviews == 1) return 'Based on 1 review';
    return 'Based on $totalReviews reviews';
  }
}