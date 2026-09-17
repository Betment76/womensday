import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

/// HTTP-клиент T‑Bank: HARICA + Минцифры.
/// User CA на Android приложения не видят — сертификаты в assets.
class TBankHttpClient {
  TBankHttpClient._();

  static http.Client? _cachedClient;
  static Future<http.Client>? _initFuture;
  static const Duration _connectionTimeout = Duration(seconds: 15);
  static const Duration _idleTimeout = Duration(seconds: 15);
  static const List<String> _certificateAssets = <String>[
    'assets/certs/harica_tbank.crt',
    'assets/certs/russian_trusted_root_ca.crt',
    'assets/certs/russian_trusted_sub_ca.crt',
  ];

  static Future<http.Client> getClient() {
    if (_cachedClient != null) {
      return Future<http.Client>.value(_cachedClient);
    }
    _initFuture ??= _buildClient();
    return _initFuture!;
  }

  static Future<http.Client> _buildClient() async {
    final SecurityContext context = SecurityContext(withTrustedRoots: true);
    for (final String assetPath in _certificateAssets) {
      try {
        final ByteData data = await rootBundle.load(assetPath);
        final String pemText = utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          allowMalformed: true,
        );
        for (final Uint8List certBytes in _extractPemCertificateBytes(
          pemText,
        )) {
          context.setTrustedCertificatesBytes(certBytes);
        }
      } catch (_) {
        // Пропускаем битый файл — не блокируем запуск.
      }
    }
    final HttpClient ioHttpClient = HttpClient(context: context)
      ..connectionTimeout = _connectionTimeout
      ..idleTimeout = _idleTimeout;
    final http.Client client = IOClient(ioHttpClient);
    _cachedClient = client;
    return client;
  }

  static List<Uint8List> _extractPemCertificateBytes(String pemText) {
    final RegExp blockPattern = RegExp(
      r'-----BEGIN CERTIFICATE-----[\s\S]*?-----END CERTIFICATE-----',
      multiLine: true,
    );
    final List<Uint8List> result = <Uint8List>[];
    for (final Match match in blockPattern.allMatches(pemText)) {
      result.add(Uint8List.fromList(utf8.encode(match.group(0)!)));
    }
    return result;
  }
}
