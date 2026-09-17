/// Сессия оплаты через PayTbank.
class PaymentSession {
  const PaymentSession({
    required this.paymentId,
    required this.paymentUrl,
    required this.orderId,
    required this.amountRubles,
  });

  final String paymentId;
  final String paymentUrl;
  final String orderId;
  final double amountRubles;
}

/// Нормализованный статус из PayTbank /status.php.
class PaymentStatus {
  const PaymentStatus({
    required this.isRequestOk,
    required this.isPaid,
    required this.isFinalFailed,
    this.bankStatus,
    this.paymentId,
    this.orderId,
    this.message,
  });

  final bool isRequestOk;
  final bool isPaid;
  final bool isFinalFailed;
  final String? bankStatus;
  final String? paymentId;
  final String? orderId;
  final String? message;

  bool get isRefunded {
    return bankStatus == 'CANCELLED' ||
        bankStatus == 'REVERSED' ||
        bankStatus == 'REFUNDED' ||
        bankStatus == 'PARTIAL_REFUNDED';
  }

  static const List<String> paidStatuses = <String>['CONFIRMED', 'AUTHORIZED'];
  static const List<String> failedStatuses = <String>[
    'CANCELLED',
    'REJECTED',
    'DEADLINE_EXPIRED',
    'REVERSED',
    'REFUNDED',
    'PARTIAL_REFUNDED',
  ];

  factory PaymentStatus.fromBackend(Map<String, dynamic> raw) {
    final String? status =
        raw['status']?.toString() ?? raw['Status']?.toString();
    final bool paid = raw['paid'] == true || paidStatuses.contains(status);
    final bool failed = failedStatuses.contains(status);
    return PaymentStatus(
      isRequestOk: raw['success'] != false,
      isPaid: paid,
      isFinalFailed: failed,
      bankStatus: status,
      paymentId: raw['payment_id']?.toString() ?? raw['PaymentId']?.toString(),
      orderId: raw['order_id']?.toString() ?? raw['OrderId']?.toString(),
      message: raw['message']?.toString() ?? raw['Message']?.toString(),
    );
  }
}
