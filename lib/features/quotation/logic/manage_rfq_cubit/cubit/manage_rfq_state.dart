part of 'manage_rfq_cubit.dart';

@freezed
class ManageRfqState with _$ManageRfqState {
  const factory ManageRfqState.initial() = _Initial;
    const factory ManageRfqState.success(List<RFQModel> rfqs) =
      ManageRfqStatetSuccessState;
  const factory ManageRfqState.failed(ApiErrorModel error) =
      ManageRfqStatetFailedState;
  const factory ManageRfqState.loading() =
      ManageRfqStatetLoadingsState;
  const factory ManageRfqState.filter() =
      ManageRfqStatetFilterState;
}
