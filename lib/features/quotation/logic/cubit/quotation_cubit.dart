import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/quotation_model.dart';

part 'quotation_state.dart';

// Maximum number of steps in the quotation process
const int maxSteps = 3;

class QuotationCubit extends Cubit<QuotationState> {
  QuotationCubit() : super(QuotationState.initial());
  
  // Current step in the quotation process
  int currentStep = 0;
  
  // Form controllers for product details
  final productNameController = TextEditingController();
  final quantityController = TextEditingController();
  final notesController = TextEditingController();
  
  // Form controllers for contact details
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final companyNameController = TextEditingController();

  // Form keys for validation
  final productFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();

  void submitQuotation() {
    final quotation = QuotationModel(
      productName: productNameController.text,
      quantity: int.tryParse(quantityController.text) ?? 0,
      notes: notesController.text.isEmpty ? null : notesController.text,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      companyName: companyNameController.text.isEmpty ? null : companyNameController.text,
    );
    
    // Here you would typically send the quotation to an API
    // For now, we'll just update the state to show success
    emit(state.copyWith(isSubmitting: true));
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(
        isSubmitting: false,
        isSubmitted: true,
        quotation: quotation,
      ));
    });
  }
  
  // Navigation methods for multi-step form
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

  @override
  Future<void> close() {
    // Dispose product details controllers
    productNameController.dispose();
    quantityController.dispose();
    notesController.dispose();
    
    // Dispose contact details controllers
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    companyNameController.dispose();
    
    return super.close();
  }
}