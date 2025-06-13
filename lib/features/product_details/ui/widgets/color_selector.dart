import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedColorIndex;
  final Function(int) onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedColorIndex;

          return GestureDetector(
            onTap: () => onColorSelected(index),
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                  width: isSelected ? 2 : 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
            ),
          );
        },
      ),
    );
  }
}
