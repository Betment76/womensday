import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/domain/entities/payment_session.dart';

/// Оплата через PayTbank, как в эталоне Proklinator.
class TBankPaymentService {
  TBankPaymentService({required this._client});

  final http.Client _client;

  String generateOrderId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<PaymentSession> executeInitPayment({
    required String orderId,
    required double amountRubles,
    required String description,
    String? email,
  }) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'app_id': TBankConfig.appId,
      'mode': TBankConfig.mode,
      'token': TBankConfig.appToken,
      'amount': amountRubles,
      'order_id': orderId,
      'description': description,
      'success_url': TBankConfig.successUrl,
      'fail_url': TBankConfig.failUrl,
      'use_sbp_qr': true,
      'data': <String, dynamic>{'connection_type': 'Widget'},
    };
    final String? trimmedEmail = email?.trim();
    if (trimmedEmail != null && trimmedEmail.isNotEmpty) {
      body['email'] = trimmedEmail;
    }
    final Map<String, dynamic> response = await _postBackend('/init.php', body);
    final String paymentId =
        (response['payment_id'] ?? response['PaymentId'] ?? '').toString();
    String paymentUrl =
        (response['payment_url'] ?? response['PaymentURL'] ?? '').toString();
    final String payloadUrl = (response['payload_url'] ?? '').toString();
    if (payloadUrl.isNotEmpty && kReleaseMode) {
      paymentUrl = payloadUrl;
    }
    if (paymentId.isEmpty || paymentUrl.isEmpty) {
      throw Exception(
        response['message']?.toString() ?? 'Пустой payment_id/payment_url',
      );
    }
    return PaymentSession(
      paymentId: paymentId,
      paymentUrl: paymentUrl,
      orderId: (response['order_id'] ?? orderId).toString(),
      amountRubles: amountRubles,
    );
  }

  Future<PaymentStatus> executeFetchStatus({
    String? paymentId,
    String? orderId,
  }) async {
    if ((paymentId == null || paymentId.isEmpty) &&
        (orderId == null || orderId.isEmpty)) {
      throw ArgumentError('Нужен payment_id или order_id');
    }
    final Map<String, dynamic> request = <String, dynamic>{
      'app_id': TBankConfig.appId,
      'mode': TBankConfig.mode,
      'token': TBankConfig.appToken,
    };
    if (paymentId != null && paymentId.isNotEmpty) {
      request['payment_id'] = paymentId;
    }
    if (orderId != null && orderId.isNotEmpty) {
      request['order_id'] = orderId;
    }
    final Map<String, dynamic> raw = await _postBackend('/status.php', request);
    return PaymentStatus.fromBackend(raw);
  }

  Future<Map<String, dynamic>> _postBackend(
    String path,
    Map<String, dynamic> body,
  ) async {
    final http.Response response = await _client
        .post(
          Uri.parse('${TBankConfig.backendBaseUrl}$path'),
          headers: const <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(TBankConfig.requestTimeout);
    if (response.statusCode != 200) {
      throw Exception('HTTP ошибка: ${response.statusCode}');
    }
    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Некорректный ответ сервера оплаты');
    }
    return decoded;
  }
}
