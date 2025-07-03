part of '../ratings_reviews_screen.dart';


class RatingSummaryHeader extends StatelessWidget {
  const RatingSummaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Customer Reviews',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}