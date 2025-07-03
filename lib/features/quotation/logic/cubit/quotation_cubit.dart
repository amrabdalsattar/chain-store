import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../data/models/quotation_model.dart';
import '../../data/models/rfq_model.dart';
import '../../data/models/rfq_request_model.dart';
import '../../data/models/rfq_category_response.dart';
import '../../data/models/rfq_recommended_supplier_response.dart';
import '../../data/repos/quotation_repo.dart';

part 'quotation_state.dart';

const int maxSteps = 3;

class QuotationCubit extends Cubit<QuotationState> {
  final QuotationRepo quotationRepo;
  QuotationCubit(this.quotationRepo) : super(QuotationState.initial());

  final GlobalKey<FormState> formKey = GlobalKey();
  bool shareBusinessCard = false;
  bool isPolicySelected = false;

  int currentStep = 0;
  final productNameController = TextEditingController();
  final quantityController = TextEditingController();
  final detailsController = TextEditingController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final companyNameController = TextEditingController();

  final productFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();

  List<File> images = [];

  Future<void> fetchRFQQuotations(String rfqId) async {
    emit(
      state.copyWith(
        isLoading: true,
        rfqState: RFQState.rfqQuotationsState,
        clearErrorMessage: true,
      ),
    );
    final result = await quotationRepo.getRFQQuotations(rfqId);
    result.when(
      success: (data) {
        final quotations = data as QuotationResponseModel;
        emit(
          state.copyWith(
            isLoading: false,
            quotations: quotations.data,
            clearErrorMessage: true,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.message));
      },
    );
  }

  Future<void> getCustomerRFQs() async {
    emit(
      state.copyWith(
        isLoading: true,
        rfqState: RFQState.manageRFQState,
        clearErrorMessage: true,
      ),
    );
    final result = await quotationRepo.getCustomerRFQs();
    result.when(
      success: (quotatoins) {
        emit(
          state.copyWith(
            isLoading: false,
            rfqs: quotatoins,
            clearErrorMessage: true,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isSubmitting: false, errorMessage: error.message));
      },
    );
  }

  Future<void> submitQuotation() async {
    if (!isPolicySelected) {
      emit(state.copyWith(errorMessage: 'Please Accept the polices'));
      return;
    }
    emit(
      state.copyWith(
        isSubmitting: true,
        rfqState: RFQState.newRFQState,
        clearErrorMessage: true,
      ),
    );
    final quotation = RFQRequestModel(
      customerId: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userId,
      ),
      productName: nameController.text,
      categoryId: state.selectedCategory ?? 0,
      quantity: int.parse(quantityController.text),
      unit: 'piece',
      shareBusinessCard: shareBusinessCard,
      description: detailsController.text,
      deadline: DateTime.now().add(const Duration(days: 7)).toIso8601String(),
    );
    final result = await quotationRepo.createQuotation(quotation);
    result.when(
      success: (id) {
        emit(
          state.copyWith(
            isSubmitting: false,
            isSubmitted: true,
            rfqId: id,
            clearErrorMessage: true,
            rfqState: RFQState.newRFQState,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: error.message,
            isSubmitted: false,
          ),
        );
      },
    );
  }

  Future<void> changeQuotationStatus(
    int quotationId, {
    bool isReject = false,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        rfqState: RFQState.quotationState,
        clearErrorMessage: true,
      ),
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
          state.copyWith(
            isLoading: false,
            rfqState: RFQState.quotationState,
            clearErrorMessage: true,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: error.message,
            rfqState: RFQState.quotationState,
          ),
        );
      },
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(clearErrorMessage: true));
  }

  void nextStep() {
    if (currentStep == 0 && productFormKey.currentState!.validate()) {
      currentStep = 1;
      emit(state.copyWith());
    } else if (currentStep == 1 && contactFormKey.currentState!.validate()) {
      currentStep = 2;
      emit(state.copyWith());
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(state.copyWith());
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step < maxSteps) {
      currentStep = step;
      emit(state.copyWith());
    }
  }

  void setRFQId(int id) {
    emit(state.copyWith(rfqId: id));
  }

  void setQuotationId(int quotation) {
    emit(state.copyWith(quotationId: quotation));
  }

  @override
  Future<void> close() {
    productNameController.dispose();
    quantityController.dispose();
    detailsController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    companyNameController.dispose();
    return super.close();
  }
}
