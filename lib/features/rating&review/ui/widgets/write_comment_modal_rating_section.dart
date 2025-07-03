part of '../ratings_reviews_screen.dart';

class WriteCommentModalRatingSection extends StatefulWidget {
  const WriteCommentModalRatingSection({super.key, required this.onChange});
  final ValueChanged<double> onChange;

  @override
  State<WriteCommentModalRatingSection> createState() =>
      _WriteCommentModalRatingSectionState();
}

class _WriteCommentModalRatingSectionState
    extends State<WriteCommentModalRatingSection> {
  double _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this product',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorsHelper.black,
          ),
        ),
        verticalSpace(12),
        RatingBar.builder(
          glow: false,
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
          itemBuilder:
              (context, _) =>
                  const Icon(Icons.star_rate_rounded, color: Colors.amber),
          onRatingUpdate: (rating) {
            setState(() {
              _selectedRating = rating;
            });
            widget.onChange(rating);
          },
        ),
        if (_selectedRating > 0) ...[
          verticalSpace(8),
          Text(
            _getRatingText(_selectedRating),
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorsHelper.primaryColor,
            ),
          ),
        ],
      ],
    );
  }

  String _getRatingText(double rating) {
    switch (rating.toInt()) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent';
      default:
        return '';
    }
  }
}
