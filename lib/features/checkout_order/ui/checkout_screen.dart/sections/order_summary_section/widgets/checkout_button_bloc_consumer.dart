import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../../../../../../core/helpers/dialogs_helper.dart';
import '../../../../../../../core/helpers/extensions.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/theming/colors_helper.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../data/models/payment_intent_input_model.dart';
import '../../../../../logic/cubit/checkout_cubit.dart';

class CheckoutButtonBlocConsumer extends StatelessWidget {
  final double totalAmount;
  const CheckoutButtonBlocConsumer({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      bloc: context.read<CheckoutCubit>(),
      listener: (context, state) {
        switch (state) {
          case StripePaymentSuccess():
            context.pop();
            context.pop();
            DialogsHelper.showToastificationMessage(
              context: context,
              title: 'Order Confirmed',
              description:
                  'Your order has been placed successfully. Thank you for shopping with us!',
              type: ToastificationType.success,
              alignment: Alignment.topCenter,
            );
          case StripePaymentFailure():
            context.pop();
            DialogsHelper.showToastificationMessage(
              context: context,
              title: 'Checkout Failed',
              description: 'Unable to place your order. Please try again.',
              type: ToastificationType.error,
              alignment: Alignment.topCenter,
            );

          default:
        }
      },
      builder:
          (context, state) => Container(
            color: ColorsHelper.white,
            padding: EdgeInsets.only(bottom: 24.h),
            child: CustomButton(
              title: 'Confirm Order',
              width: double.infinity,
              isLoading: state is StripePaymentLoading,
              radius: 12,
              height: 46,
              borderColor: ColorsHelper.primaryColor,
              onTap: () async {
                if (context.read<CheckoutCubit>().isCreditCardPayment) {
                  await context.read<CheckoutCubit>().executePayment(
                    PaymentIntentInputModel(
                      amount: totalAmount + 100,
                      currency: 'EGP',
                      customerId: '123456Aa',
                    ),
                  );
                  context.pushNamed(Routes.orderConfirmationRoute);
                } else {
                  context.pushNamed(Routes.orderConfirmationRoute);
                }
              },
            ),
          ),
    );
  }
}
