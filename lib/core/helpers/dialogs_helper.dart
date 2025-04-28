import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';
import '../widgets/custom_button.dart';
import '../widgets/loading_indicator.dart';
import 'extensions.dart';
import 'spacing.dart';

class DialogsHelper {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LoadingIndicator(color: ColorsHelper.white),
    );
  }

  static void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: ColorsHelper.red, size: 32),
            content: Text(error, style: AppTextStyles.rubikPrimaryBold16),
            actions: [
              TextButton(
                child: Text('OK', style: AppTextStyles.rubikPrimaryBold16),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  static void showMessageBottomSheet({
    required BuildContext context,
    required String message,
    VoidCallback? onClose,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsHelper.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: false,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: AppTextStyles.robotoBlackSemiBold16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
              CustomButton(
                title: 'close',
                width: 324.w,
                onTap: () {
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: Text(message),
        backgroundColor: backgroundColor ?? ColorsHelper.green,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<bool?> showPopDialog({
    required BuildContext context,
    required String message,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)..pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  static void showConfirmationDialog({
    required BuildContext context,
    required String message,
    required VoidCallback onContinue,
    required VoidCallback onCancel,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text(message, style: AppTextStyles.rubikBlackBold15),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: AppTextStyles.rubikPrimaryBold16.copyWith(
                    color: ColorsHelper.rejectedOrderBackGroundColor,
                  ),
                ),
                onPressed: () {
                  onCancel();
                  context.pop();
                },
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: AppTextStyles.rubikPrimaryBold16.copyWith(
                    color: ColorsHelper.green,
                  ),
                ),
                onPressed: () {
                  onContinue();
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  static void showToastificationMessage({
    required BuildContext context,
    required String title,
    required String description,
    required ToastificationType type,
    required Alignment alignment,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 4),
      title: Text(title),
      description: RichText(text: TextSpan(text: description)),
      alignment: alignment,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      showIcon: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.onHover,
        buttonBuilder: (context, onClose) {
          return OutlinedButton.icon(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 20),
            label: const Text('Close'),
          );
        },
      ),
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  static showBasicToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
