import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(
          icon: Icons.remove,
          onPressed: quantity > 1 ? onDecrease : null,
        ),
        horizontalSpace(4),
        Container(
          width: 40.w,
          alignment: Alignment.center,
          child: Text(
            quantity.toString(),
            style: AppTextStyles.robotoBlackSemiBold16.copyWith(
              color: ColorsHelper.black,
            ),
          ),
        ),
        horizontalSpace(4),
        _buildButton(icon: Icons.add, onPressed: onIncrease),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    final isEnabled = onPressed != null;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: isEnabled ? ColorsHelper.white : ColorsHelper.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color:
                isEnabled ? ColorsHelper.primaryColor : ColorsHelper.borderGray,
            width: 1.5,
          ),
          boxShadow:
              isEnabled
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ]
                  : null,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 14,
          color:
              isEnabled ? ColorsHelper.primaryColor : ColorsHelper.fadedBlack,
        ),
      ),
    );
  }
}
