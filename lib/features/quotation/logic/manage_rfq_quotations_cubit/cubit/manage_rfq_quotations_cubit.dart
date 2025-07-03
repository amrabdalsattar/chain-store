import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../../data/models/quotation_model.dart';
import '../../../data/repos/quotation_repo.dart';

part 'manage_rfq_quotations_state.dart';
part 'manage_rfq_quotations_cubit.freezed.dart';

class ManageRFQQuotationCubit extends Cubit<ManageRFQQuotationsState> {
  final QuotationRepo quotationRepo;
  ManageRFQQuotationCubit(this.quotationRepo)
    : super(const ManageRFQQuotationsState.initial());

  late QuotationModel _currentQuotation;

  Future<void> fetchRFQQuotations(String rfqId) async {
    emit(const ManageRFQQuotationsState.loading());
    final result = await quotationRepo.getRFQQuotations(rfqId);
    result.when(
      success: (data) {
        final quotations = data as QuotationResponseModel;
        emit(ManageRFQQuotationsState.success(quotations));
      },
      failure: (error) {
        emit(ManageRFQQuotationsState.failed(error));
      },
    );
  }


  Future<void> respondToQuotation(
    int quotationId, {
    bool isReject = false,
  }) async {
    emit(
      const ManageRFQQuotationsState.quotationResponseLoading()
    );
    late var result;
    if (isReject) {
      result = await quotationRepo.rejectQuotation(quotationId);
    } else {
      result = await quotationRepo.acceptQuotatoin(quotationId);
    }

    result.when(
      success: (success) {
        emit(
          const ManageRFQQuotationsState.quotationResponseSuccess()
        );
      },
      failure: (error) {
        emit(
          ManageRFQQuotationsState.quotationResponseFailed(error)
        );
      },
    );
  }



  
  void setCurrentQuotation(QuotationModel quotation) {
    _currentQuotation = quotation;
  }
}

