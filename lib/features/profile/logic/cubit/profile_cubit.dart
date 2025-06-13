import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  // Add profile-related methods here
  void logout() {
    // Implement logout functionality
    emit(const ProfileState.logoutLoading());
    
    // Here you would typically call a repository method to handle logout
    // For now, we'll just emit a success state after a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(const ProfileState.logoutSuccess());
    });
  }
}