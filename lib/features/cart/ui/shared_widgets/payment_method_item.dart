import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class PaymentMethodItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData iconData;

  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
    required this.iconData,
  });

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onTap?.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Radio Button with improved styling
              Theme(
                data: ThemeData(
                  radioTheme: RadioThemeData(
                    fillColor: WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return ColorsHelper.black;
                      }
                      return Colors.grey.shade400;
                    }),
                  ),
                ),
                child: Radio<bool>(
                  value: true,
                  groupValue: widget.isSelected ? true : false,
                  onChanged: (_) => widget.onTap?.call(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              // Payment Method Info
              Expanded(
                child: Row(
                  children: [
                    // Payment Method Icon
                    Container(
                      width: 44.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: ColorsHelper.gray.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Icon(
                        widget.iconData,
                        size: 20.r,
                        color: ColorsHelper.black,
                      ),
                    ),
                    horizontalSpace(16),

                    // Payment Method Name
                    Expanded(
                      child: Text(
                        widget.title,
                        style: AppTextStyles.rubikBlackRegular16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
