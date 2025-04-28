import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/reset_password_cubit.dart';
import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<ResetPasswordCubit>().otpVerificationFormKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          children: List.generate(
            4,
            (index) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(focusNodes[index]);
                },
                child: OtpTextField(
                    onChanged: (value) {
                      // Moves the focus Forward
                      if (value.length == 1 && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - 1]);
                      }

                      // Check if last field is filled AND all fields have input
                      if (index == 0 &&
                          context
                              .read<ResetPasswordCubit>()
                              .otpControllers
                              .every(
                                  (controller) => controller.text.isNotEmpty)) {
                        FocusScope.of(context).unfocus();
                        context
                            .read<ResetPasswordCubit>()
                            .emitOtpVerificationStates();
                      }
                      // Move focus
                      else if (value.isEmpty && index < focusNodes.length - 1) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + 1]);
                      }
                    },
                    textEditingController: context
                        .read<ResetPasswordCubit>()
                        .otpControllers[index],
                    focusNode: focusNodes[index]),
              );
            },
          ),
        ));
  }
}
