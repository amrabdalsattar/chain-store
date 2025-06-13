import 'package:connect_chain_market/core/helpers/app_images.dart';
import 'package:connect_chain_market/core/helpers/spacing.dart';
import 'package:connect_chain_market/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final bool isLoading = state.maybeWhen(
          logoutLoading: () => true,
          orElse: () => false,
        );

        return InkWell(
          onTap:
              isLoading
                  ? null
                  : () {
                    context.read<ProfileCubit>().logout();
                  },
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child:
                    isLoading
                        ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFFEA2C2C),
                          ),
                        )
                        : SvgPicture.asset(AppImages.logoutIcon),
              ),
              horizontalSpace(8),
              Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFEA2C2C),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
