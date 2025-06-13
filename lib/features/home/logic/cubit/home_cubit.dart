import 'package:bloc/bloc.dart';
import 'package:connect_chain_market/features/home/data/models/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Future<void> loadHomeData() async {
    emit(const HomeState.loading());
    try {
      // In a real app, this would be fetched from an API
      // For now, we'll use sample data
      final homeData = HomeModel.getSampleHomeData();
      emit(HomeState.loaded(homeData));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}