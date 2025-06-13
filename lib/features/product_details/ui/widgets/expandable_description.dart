import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;
  final bool isLong;
  final int maxLines;
  const ExpandableDescription({
    required this.description,
    required this.isLong,
    required this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: widget.isLong && !isExpanded ? widget.maxLines : null,
          overflow: widget.isLong && !isExpanded ? TextOverflow.ellipsis : null,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.liteBlue,
            height: 1.5,
          ),
        ),
        if (widget.isLong)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'See Less' : 'See More',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorsHelper.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
