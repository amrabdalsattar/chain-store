part of '../ratings_reviews_screen.dart';


class WriteReviewButton extends StatelessWidget {
  final VoidCallback onTap;
  const WriteReviewButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text('Write a Review'),
      ),
    );
  }
}