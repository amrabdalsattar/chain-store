part of '../ratings_reviews_screen.dart';

class RatingBars extends StatelessWidget {
  final int totalReviews;
  const RatingBars({super.key, required this.totalReviews});

  @override
  Widget build(BuildContext context) {
    final ratingDistribution = [
      {'stars': 5, 'count': (totalReviews * 0.6).round()},
      {'stars': 4, 'count': (totalReviews * 0.25).round()},
      {'stars': 3, 'count': (totalReviews * 0.1).round()},
      {'stars': 2, 'count': (totalReviews * 0.03).round()},
      {'stars': 1, 'count': (totalReviews * 0.02).round()},
    ];
    return Column(
      children: ratingDistribution.map((rating) {
        final percentage = totalReviews > 0 ? rating['count']! / totalReviews : 0.0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Text(
                '${rating['stars']}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, size: 12, color: Colors.amber),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}