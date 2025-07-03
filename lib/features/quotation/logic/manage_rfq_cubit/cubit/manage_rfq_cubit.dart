import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../../data/models/rfq_model.dart';
import '../../../data/repos/quotation_repo.dart';

part 'manage_rfq_state.dart';
part 'manage_rfq_cubit.freezed.dart';

class ManageRFQCubit extends Cubit<ManageRfqState> {
  final QuotationRepo quotationRepo;

  ManageRFQCubit(this.quotationRepo) : super(const ManageRfqState.initial());

  List<RFQModel> _allRfqs = [];

  Future<void> getCustomerRFQs() async {
    emit(const ManageRfqState.loading());
    final result = await quotationRepo.getCustomerRFQs();
    result.when(
      success: (rfqs) {
        _allRfqs = rfqs;
        emit(ManageRfqState.success(rfqs));
      },
      failure: (error) {
        emit(ManageRfqState.failed(error));
      },
    );
  }

  void filterRfqs({String? nameQuery, DateTime? date}) {
    final filtered =
        _allRfqs.where((rfq) {
          final matchesName =
              nameQuery == null || nameQuery.isEmpty
                  ? true
                  : (rfq.productName?.toLowerCase().contains(
                        nameQuery.toLowerCase(),
                      ) ??
                      false);

          final matchesDate =
              date == null
                  ? true
                  : (rfq.deadline != null &&
                      rfq.deadline!.year == date.year &&
                      rfq.deadline!.month == date.month &&
                      rfq.deadline!.day == date.day);

          return matchesName && matchesDate;
        }).toList();
    emit(ManageRfqState.success(filtered));
  }
}
