import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int maxRating;
  final Color filledStarColor;
  final Color unfilledStarColor;

  StarRating({
    required this.rating,
    required this.maxRating,
    this.filledStarColor = Colors.amber,
    this.unfilledStarColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= maxRating; i++) {
      if (i <= rating) {
        stars.add(Icon(
          Icons.star,
          color: filledStarColor,
          size: 15.w,
        ));
      } else if (i - rating < 1) {
        stars.add(Icon(
          Icons.star_half,
          color: filledStarColor,
          size: 15.w,
        ));
      } else {
        stars.add(Icon(
          Icons.star_border,
          color: unfilledStarColor,
          size: 15.w,
        ));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
