part of 'manage_rfq_quotations_cubit.dart';

@freezed
class ManageRFQQuotationsState with _$QuotationDetailsState {
  const factory ManageRFQQuotationsState.initial() = _Initial;
  const factory ManageRFQQuotationsState.success(
    QuotationResponseModel quotations,
  ) = QuotationDetailsSuccessState;
  const factory ManageRFQQuotationsState.loading() =
      QuotationDetailsLoadingState;
  const factory ManageRFQQuotationsState.failed(ApiErrorModel error) =
      QuotationDetailFailedsState;

  const factory ManageRFQQuotationsState.quotationResponseLoading() =
      QuotationSuccessResponseState;
  const factory ManageRFQQuotationsState.quotationResponseSuccess() =
      QuotationResponsLoadingeState;
  const factory ManageRFQQuotationsState.quotationResponseFailed(
    ApiErrorModel error,
  ) = QuotationResponseFailedState;
}
