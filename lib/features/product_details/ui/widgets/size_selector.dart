import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String? selectedSize;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        itemBuilder: (context, index) {
          final size = sizes[index];
          final isSelected = size == selectedSize;

          return GestureDetector(
            onTap: () => onSizeSelected(size),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color:
                    isSelected ? ColorsHelper.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? ColorsHelper.primaryColor
                          : ColorsHelper.borderGray,
                  width: 1.5,
                ),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: ColorsHelper.primaryColor.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : null,
              ),
              alignment: Alignment.center,
              child: Text(
                size,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? ColorsHelper.white : ColorsHelper.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
