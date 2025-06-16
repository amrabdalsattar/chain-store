import 'automatic_payment_methods.dart';
import 'payment_method_options.dart';

class PaymentIntentModel {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  String? customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? liveMode;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<dynamic>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      PaymentIntentModel(clientSecret: json['client_secret'] as String?);

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'amount': amount,
    'amount_capturable': amountCapturable,
    'amount_received': amountReceived,
    'application': application,
    'application_fee_amount': applicationFeeAmount,
    'automatic_payment_methods': automaticPaymentMethods?.toJson(),
    'canceled_at': canceledAt,
    'cancellation_reason': cancellationReason,
    'capture_method': captureMethod,
    'client_secret': clientSecret,
    'confirmation_method': confirmationMethod,
    'created': created,
    'currency': currency,
    'customer': customer,
    'description': description,
    'invoice': invoice,
    'last_payment_error': lastPaymentError,
    'latest_charge': latestCharge,
    'livemode': liveMode,
    'next_action': nextAction,
    'on_behalf_of': onBehalfOf,
    'payment_method': paymentMethod,
    'payment_method_options': paymentMethodOptions?.toJson(),
    'payment_method_types': paymentMethodTypes,
    'processing': processing,
    'receipt_email': receiptEmail,
    'review': review,
    'setup_future_usage': setupFutureUsage,
    'shipping': shipping,
    'source': source,
    'statement_descriptor': statementDescriptor,
    'statement_descriptor_suffix': statementDescriptorSuffix,
    'status': status,
    'transfer_data': transferData,
    'transfer_group': transferGroup,
  };
}
