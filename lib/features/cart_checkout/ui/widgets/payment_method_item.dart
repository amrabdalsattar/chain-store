import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class PaymentMethodItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isAddNewCard;

  const PaymentMethodItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isSelected,
    this.onTap,
    this.isAddNewCard = false,
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
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color:
                    widget.isSelected
                        ? ColorsHelper.primaryColor
                        : const Color(0xFFE0E0E0),
                width: 1.5,
              ),
              color:
                  widget.isSelected
                      ? ColorsHelper.primaryColor.withOpacity(0.05)
                      : Colors.white,
              boxShadow:
                  widget.isSelected
                      ? [
                        BoxShadow(
                          color: ColorsHelper.primaryColor.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                      : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Payment Method Info
                Expanded(
                  child: Row(
                    children: [
                      // Payment Method Icon
                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorsHelper.homeScaffoldColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Icon(
                                  Icons.credit_card,
                                  size: 24.w,
                                  color: Colors.grey,
                                ),
                          ),
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

                // Radio Button with improved styling
                Theme(
                  data: ThemeData(
                    radioTheme: RadioThemeData(
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return ColorsHelper.primaryColor;
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildCardForm() {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Card Details', style: AppTextStyles.rubikBlackBold20),
          verticalSpace(16),

          // Card Number
          _buildTextField(
            controller: TextEditingController(),
            label: 'Card Number',
            hintText: '1234 5678 9012 3456',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              _CardNumberFormatter(),
            ],
            prefixIcon: Icons.credit_card,
          ),
          verticalSpace(16),

          // Expiry Date and CVV
          Row(
            children: [
              // Expiry Date
              Expanded(
                child: _buildTextField(
                  controller: TextEditingController(),
                  label: 'Expiry Date',
                  hintText: 'MM/YY',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    _ExpiryDateFormatter(),
                  ],
                ),
              ),
              horizontalSpace(16),

              // CVV
              Expanded(
                child: _buildTextField(
                  controller: TextEditingController(),
                  label: 'CVV',
                  hintText: '123',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(16),

          // Cardholder Name
          _buildTextField(
            controller: TextEditingController(),
            label: 'Cardholder Name',
            hintText: 'John Doe',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),
          verticalSpace(24),

          // Save Card Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Save card logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Card saved successfully')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsHelper.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Save Card',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    IconData? prefixIcon,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.sp,
              color: Colors.grey,
            ),
            prefixIcon:
                prefixIcon != null
                    ? Icon(prefixIcon, color: Colors.grey)
                    : null,
            filled: true,
            fillColor: ColorsHelper.homeScaffoldColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: ColorsHelper.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && i != text.length - 1) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
