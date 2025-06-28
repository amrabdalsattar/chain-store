import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../../../../../../core/helpers/dialogs_helper.dart';
import '../../../../../../../core/helpers/extensions.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/theming/colors_helper.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../../../data/models/stripe_models/payment_intent_input_model.dart';
import '../../../../../logic/cubit/checkout_cubit.dart';

class CheckoutButtonBlocConsumer extends StatelessWidget {
  final CartCubit cartCubit;
  const CheckoutButtonBlocConsumer({super.key, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      bloc: context.read<CheckoutCubit>(),
      listener: (context, state) {
        switch (state) {
          case PlaceOrderSuccess():
            context.pushReplacementNamed(
              Routes.orderConfirmationRoute,
              arguments: context.read<CheckoutCubit>().isCreditCardPayment,
            );
            cartCubit.clearCart();
          case CheckoutOrderFailure():
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
              isLoading: state is CheckoutOrderLoading,
              radius: 12,
              height: 46,
              borderColor: ColorsHelper.primaryColor,
              onTap: () async {
                if (context.read<CheckoutCubit>().isCreditCardPayment) {
                  await context.read<CheckoutCubit>().executePayment(
                    PaymentIntentInputModel(
                      amount:
                          cartCubit.totalPrice + (cartCubit.totalPrice * 0.01),
                      currency: 'EGP',
                      customerId: '123456Aa',
                    ),
                  );
                } else {
                  context.read<CheckoutCubit>().placeOrder();
                }
              },
            ),
          ),
    );
  }
}
