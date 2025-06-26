import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/cache/user_data_operator.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.initial());

  // Add profile-related methods here
  void logout() {
    // Implement logout functionality
    emit(const AccountState.logoutLoading());

    // Here you would typically call a repository method to handle logout
    // For now, we'll just emit a success state after a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      UserDataOperator.clearUserData();
      emit(const AccountState.logoutSuccess());
    });
  }
}
